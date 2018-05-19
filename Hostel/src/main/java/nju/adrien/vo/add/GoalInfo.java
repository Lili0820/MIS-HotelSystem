package nju.adrien.vo.add;

/**
 * Created by CLL on 18/5/19.
 */
public class GoalInfo {
    String date;
    int goalIncome;
    int actualIncome;
    double rate;

    public GoalInfo(String date, int goalIncome, int actualIncome, double rate) {
        this.date = date;
        this.goalIncome = goalIncome;
        this.actualIncome = actualIncome;
        this.rate = rate;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getGoalIncome() {
        return goalIncome;
    }

    public void setGoalIncome(int goalIncome) {
        this.goalIncome = goalIncome;
    }

    public int getActualIncome() {
        return actualIncome;
    }

    public void setActualIncome(int actualIncome) {
        this.actualIncome = actualIncome;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}
