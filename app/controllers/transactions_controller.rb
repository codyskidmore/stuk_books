class TransactionsController < ApplicationController
  def create
    book = Book.find_by_slug!(params[:slug])

    sale = book.sales.create(
      amount: book.price,
      buyer_email: current_user.email,
      seller_email: book.user.email,
      stripe_token: params[:stripeToken]
    )

    sale.process!
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid), notice: "Transaction Complete!"
    else
      redirect_to book_path(book), notice: "Transaction failed!"
    end
  end

  def pickup
    @sale = Sale.find_by_guid!(params[:guid])
    @book = @sale.book
  end
end