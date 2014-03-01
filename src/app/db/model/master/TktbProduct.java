package app.db.model.master;

import java.io.Serializable;

public class TktbProduct implements Serializable {

	private static final long serialVersionUID = 1L;

	private String tktbProductId;
	private String product;
	private String actSts;

	public String getTktbProductId() {
		return tktbProductId;
	}

	public void setTktbProductId(String tktbProductId) {
		this.tktbProductId = tktbProductId;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getActSts() {
		return actSts;
	}

	public void setActSts(String actSts) {
		this.actSts = actSts;
	}

}