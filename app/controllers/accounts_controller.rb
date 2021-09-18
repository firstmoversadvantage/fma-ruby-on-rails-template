class AccountsController < ApplicationController
  def create
    @account = Account.new(accounts_params)

    if @account.save

    else

    end
  end

  def update
  end

  private

  def accounts_params
    params.require(:account)
      .permit(
        :name,
        :billing_address,
        :billing_city,
        :billing_state,
        :billing_country_code,
        :telephone_country_code,
        :telephone
      )
  end
end
