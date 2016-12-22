class MainController < ApplicationController

  def index

    @exchange_offices = ExchangeOffice.all

  end

  def best_prices

    @prices = Price.find_min_max_price

  end

  def scraping_done

  	Scraping.office_exchange_scraping(true)
  	redirect_to best_prices_path

  end

  def scraping_not_done

    Scraping.office_exchange_scraping(false)
    redirect_to best_prices_path

  end

  def replicate_price

    Price.replicate_price
    redirect_to best_prices_path

  end

  def price_today_exchange_office

    @prices = Price.find_by_exchange_office_and_date(params[:exchange_office], Date.today)
    render "main/best_prices"

  end

  def price_date_exchange_office

  	@prices = Price.find_by_exchange_office_and_date(params[:exchange_office], Date.strptime(params[:date], "%d%m%Y"))
  	render "main/best_prices"

  end

  def all_price_exchange_office

    @prices = Price.find_by_exchange_office(params[:exchange_office])
    render "main/best_prices"

  end

  def destroy_scraping

    @prices = Price.where("date = ? or date = ?", Date.today, Date.today + 1).destroy_all
    redirect_to root_path

  end
  

end
