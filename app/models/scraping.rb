class Scraping < ActiveRecord::Base
  belongs_to :exchange_office
  belongs_to :money
  belongs_to :form
  belongs_to :price_type

  def self.office_exchange_scraping scraping_done

  	require 'open-uri'

  	ExchangeOffice.where(scraping_done: scraping_done).each do |exchange_office|

      begin
        url = open(exchange_office.url_page)
        doc = Nokogiri::HTML(url)
      rescue
        exchange_office.scraping_done = !exchange_office.scraping_done
        exchange_office.save
        next
      end

  		scrapings = Scraping.where(exchange_office_id: exchange_office.id)

  		scrapings.each do |scraping|

  			begin
	
	  			if scraping.form
  					doc = mechanize_scraping(exchange_office.url_page, scraping.form)
  				end
          
  				money_price = doc.search(scraping.scraping)[scraping.position].text
  				Price.update_or_create(scraping, money_price, Date.today)

  			rescue
  				exchange_office.scraping_done = !exchange_office.scraping_done
          exchange_office.save
          next
  			end

  		end

      if !scraping_done
        exchange_office.scraping_done = true
        exchange_office.save
      end

  	end

  end

  def self.mechanize_scraping url, form

    agent = Mechanize.new

    page = agent.get(url)

    form = page.form_with(name: form.name_form)

    form_fields = FormField.where(form_id: form.id)

  	form_fields.each do |form_field|

  		if form_field.exist

  			case form_field.type_form_field.name
  				when 'Input'
  				  form.field_with(name: form_field.name).value = form_field.value
  				when 'Radio'
  				  form.radiobutton_with(id: form_field.name).check
  				when 'Select'
  				  form.field_with(name: form_field.name).option_with(value: form_field.value).select
        end

  		else

  			form.add_field!(form_field.name, value = form_field.value)

  		end

  	end

    return agent.submit(form)

  end

end
