class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_transaction, only: %i[show approve reject]

    def index
        @transactions = Transaction.all
    end
    def new
      @transaction = current_user.transactions.new
    end
  
    def create
      @transaction = current_user.transactions.new(transaction_params)
      @transaction.status = "pending"
  
      if @transaction.save
        redirect_to @transaction, notice: "Deposit request submitted. Waiting for admin approval."
      else
        render :new
      end
    end
  
    def show
    end
  
    def approve
      @transaction.update(status: "approved")
      redirect_to transaction_index_path, notice: "Transaction approved successfully."
    end
  
    def reject
      @transaction.update(status: "rejected")
      redirect_to transaction_index_path, notice: "Transaction rejected."
    end
  
    private
  
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end
  
    def transaction_params
      params.require(:transaction).permit(:amount, :transaction_code, :screenshot)
    end
  end
  