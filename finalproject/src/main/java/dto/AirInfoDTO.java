package dto;

public class AirInfoDTO {
	private String flight;
	private String airline;
	private String d_time;
	private String a_time;
	private String seatgrade;
	private String price_ad;
	private int seat;
	private String city_code_dep;
	private String city_code_arv;
	
	public AirInfoDTO() {
	
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

	public String getD_time() {
		return d_time;
	}

	public void setD_time(String d_time) {
		this.d_time = d_time;
	}

	public String getA_time() {
		return a_time;
	}

	public void setA_time(String a_time) {
		this.a_time = a_time;
	}

	public String getSeatgrade() {
		return seatgrade;
	}

	public void setSeatgrade(String seatgrade) {
		this.seatgrade = seatgrade;
	}

	public String getPrice_ad() {
		return price_ad;
	}

	public void setPrice_ad(String price_ad) {
		this.price_ad = price_ad;
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
