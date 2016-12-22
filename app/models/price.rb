class Price < ActiveRecord::Base
  belongs_to :money
  belongs_to :exchange_office
  belongs_to :price_type

  def self.find_min_max_price

  	prices = Price.select("max(price) as price, date, price_types.name as name_price_type, exchange_offices.name as name_exchange_office, money.name as name_money")
                     .joins(:price_type)
                     .joins(:exchange_office)
                     .joins(:money)
                     .where("date = ? and price_types.name = ?", Date.today, "Compra")
                     .group("money_id")

    prices += Price.select("min(price) as price, date, price_types.name as name_price_type, exchange_offices.name as name_exchange_office, money.name as name_money")
                     .joins(:price_type)
                     .joins(:exchange_office)
                     .joins(:money)
                     .where("date = ? and price_types.name = ?", Date.today, "Venta")
                     .group("money_id")

    @prices = Price.select("price, date, price_types.name as name_price_type, exchange_offices.name as name_exchange_office, money.name as name_money")
                     .joins(:price_type)
                     .joins(:exchange_office)
                     .joins(:money)
                     .where("date = ?", Date.today)
                     .order("exchange_office_id")
                     .order("price_type_id")

  end

  def self.find_by_exchange_office_and_date exchange_office, date

  	Price.select("price, date, price_types.name as name_price_type, exchange_offices.name as name_exchange_office, money.name as name_money")
  		.joins(:price_type)
  		.joins(:exchange_office)
  		.joins(:money)
  		.where("exchange_offices.name = ? and date = ?", exchange_office_format(exchange_office), date)

  end

  def self.find_by_exchange_office exchange_office

  	Price.select("price, date, price_types.name as name_price_type, exchange_offices.name as name_exchange_office, money.name as name_money")
  		.joins(:price_type)
  		.joins(:exchange_office)
  		.joins(:money)
  		.where("exchange_offices.name = ?", exchange_office_format(exchange_office))

  end

  def self.update_or_create data, money_price, date

    price = Price.find_or_initialize_by(date: date, money_id: data.money.id, exchange_office_id: data.exchange_office.id, price_type_id: data.price_type.id)
    price.price = price_scraping_format(money_price)
    price.save

  end

  def self.replicate_price

    Price.where(date: Date.today).each do |price|
      update_or_create(price, price.price.to_s, (Date.today + 1))
    end

  end

  def self.price_scraping_format money_price

  	return (money_price.gsub(',', '.').match(/\d+(\.\d+)?/)).to_s.to_f

  end

  def self.exchange_office_format(nombre)

    return nombre.split(/(?=[A-Z])/).join(' ').titleize

  end
end
