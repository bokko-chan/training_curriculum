class CalendarsController < ApplicationController
  def index
    getWeek
    @plan = Plan.new
  end

  def create
    Plan.create(plan_params)
    redirect_to action: :index 
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan) 
  end

  def getWeek
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    @todays_date = Date.today

    @week_days = []

    plans = Plan.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_plans = []
      plan = plans.map do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end
<<<<<<< HEAD
      wday_num = Date.today.wday + x
      if wday_num >= 7 
=======
      wday_num = Date.today.wday + x  #Date.today.wdayのみだと本日の日付しか表示されない。timesメソッドからブロックパラメータに使われてるxを利用する
      #もしもwday_numが7以上であれば、7を引く
      if wday_num >= 7 #条件式を記述
>>>>>>> parent of 36713f9... Merge branch 'master' into second_training
        wday_num = wday_num - 7
      end
      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, plans: today_plans, wday: wdays[wday_num]}
      @week_days.push(days)
    end
  end
end
