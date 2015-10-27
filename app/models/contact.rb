class Contact < ActiveRecord::Base

  require 'csv'

  has_many :phones, dependent: :destroy
  has_many :emails, dependent: :destroy

  validates :first_name, :last_name, :phones, :emails, presence: true
  validates :first_name, uniqueness: { scope: :last_name }

  accepts_nested_attributes_for :phones 
  accepts_nested_attributes_for :emails 


  def self.export
    CSV.generate do |csv|
      csv << [ Contact.human_attribute_name(:first_name), Contact.human_attribute_name(:last_name), Phone.model_name.human(count: 2), Email.model_name.human(count: 2) ]
      all.each do |contact|
        csv << [ 
          contact.first_name,
          contact.last_name,
          contact.phones.map(&:name).join(' : '),
          contact.emails.map(&:name).join(' : ')
        ]
      end
    end
  end

  def self.import(file)

    processed = 0

    if file.present?

      CSV.foreach(file.path, headers: true) do |row|

        contact = Contact.find_by(first_name: row[0], last_name: row[1])
        phones = row[2].split(' : ')
        emails = row[3].split(' : ')

        next if phones.empty?
        next if emails.empty?

        if contact.present?

          p 'contact ' + contact.first_name + ' present'

          contact.phones.destroy_all
          contact.emails.destroy_all
        
          phones.each do |phone|
            contact.phones << Phone.new(name: phone)
          end

          emails.each do |email|
            contact.emails << Email.new(name: email)
          end

          if contact.save
            processed += 1
            p 'contact ' + contact.first_name + ' saved'
          else
            contact.destroy
          end
        else
          p 'contact ' + row[0] + ' creating'
          contact = Contact.new(first_name: row[0], last_name: row[1])
          phones.each do |phone|
            contact.phones << Phone.new(name: phone)
          end
          emails.each do |email|
            contact.emails << Email.new(name: email)
          end
          if contact.save
            processed += 1 
            p 'contact ' + contact.first_name + ' saved'
          end
        end 
      end
    end

    processed

  end

end
