package reservation;

import java.util.Date;

public class AirinfoDTO {
	private String flight;
	private String airline;
	private Date d_time;
	private Date a_time;
	private int price;
	private int seat;
	private String city_code_dep;
	private String city_code_arv;
	
	public AirinfoDTO() {
		
	}

	public String getFlight() {
		return flight;
	}

	public void setFlight(String flight) {
		this.flight = flight;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public Date getD_time() {
		return d_time;
	}

	public void setD_time(Date d_time) {
		this.d_time = d_time;
	}

	public Date getA_time() {
		return a_time;
	}

	public void setA_time(Date a_time) {
		this.a_time = a_time;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public String getCity_code_dep() {
		return city_code_dep;
	}

	public void setCity_code_dep(String city_code_dep) {
		this.city_code_dep = city_code_dep;
	}

	public String getCity_code_arv() {
		return city_code_arv;
	}

	public void setCity_code_arv(String city_code_arv) {
		this.city_code_arv = city_code_arv;
	}

}
