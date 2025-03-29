class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show approve reject]

  # Action to list all transactions
  def index
    @transactions = Transaction.all.includes(:user)
  end

  # Action to display the new transaction form
  def new
    @transaction = current_user.transactions.new
    @agentnumber = Transaction.last&.agentnumber 
    @local_agentnumber = "01345667889" # This can be dynamically generated or configured
  end

  # Action to create a new transaction
  def create
    @transaction = current_user.transactions.new(transaction_params)
    @transaction.status = "pending" # Set default status as pending
    
    # Check if the transaction is saved successfully
    if @transaction.save
      redirect_to @transaction, notice: "Deposit request submitted. Waiting for admin approval."
    else
      logger.debug @transaction.errors.full_messages # Log validation errors for debugging
      render :new
    end
  end

  # Action to show a specific transaction details
  def show
    @agentnumberr = Transaction.last&.agentnumber 
  end

  # Action to approve a transaction
  def approve
    if @transaction.update(status: "approved")
      redirect_to transaction_path, notice: "Transaction approved successfully."
    else
      redirect_to transaction_path, alert: "Failed to approve transaction."
    end
  end

  # Action to reject a transaction
  def reject
    if @transaction.update(status: "rejected")
      redirect_to transaction_path, notice: "Transaction rejected."
    else
      redirect_to transaction_path, alert: "Failed to reject transaction."
    end
  end

  private

  # Find a transaction by ID for specific actions like show, approve, reject
  def set_transaction
    @transaction = Transaction.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to transactions_path, alert: "Transaction not found."
  end

  # Define allowed parameters for transactions
  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_code, :screenshot, :payment_method)
  end
end
