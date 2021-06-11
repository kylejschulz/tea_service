class Customer < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :email,
                        :address

  has_many :customer_subscriptions
  has_many :subscriptions, through: :customer_subscriptions

  has_many :subscription_teas
  has_many :teas, through: :subscription_teas

  def filtered_subscriptions(params)
    # validate_params(params)
    if params[:brew_time_filter] && params[:status_filter]
      brew_time_and_status(params[:brew_time_filter], params[:status_filter])
    elsif !params[:brew_time_filter].blank?
      brew_time(params[:brew_time_filter])
    elsif !params[:status_filter].blank?
      status_filter(params[:status_filter])
    else
      subscriptions
    end

  end

  def brew_time(brew_time)
    filter_time = brew_time
    subscriptions.where('brew_time < ?', filter_time)
  end

  def status_filter(status)
    filter = status
    subscriptions.where('status = ?', filter)
  end

  def brew_time_and_status(brew_time, status)
    filter_time = brew_time
    filter = status

    subscriptions.where('brew_time < ? AND status = ?', brew_time, filter_time)

  end

  def unique_teas

    teas = subscriptions.flat_map do |sub|
      sub.teas
    end
    teas.uniq
    # subscriptions.joins(:teas).distinct
    # Tea.joins(subscriptions: :customers)
  end

  # def validate_params?(params)
  #   if valid_status?(params[:filter_status])
  # end
  #
  # def valid_status?(param)
  #   param == 'cancelled' || param == 'active'
  # end
  #
  # def valid_brew_time?(param)
  #   if param > 0
  # end
end
