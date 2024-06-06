class VendingMachineSnacksController < ApplicationController

  def create
    machine = Machine.find(params[:id])
    snack = Snack.find_by(id: params[:snack_id])
    if params[:snack_id].blank?
      flash[:error] = "Snack ID can't be blank"
    elsif snack.nil?
      flash[:error] = "Snack not found"
    else
      VendingMachineSnack.create(snack: snack, machine: machine)
      flash[:success] = "Snack added successfully"
    end
    redirect_to machine_path(machine)
  end
end