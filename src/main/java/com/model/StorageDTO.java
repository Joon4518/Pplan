package com.model;

public class StorageDTO {
	private String storage_id;
	private int schedule_id;
	private String save_date;
	private String schedule_detail;
	
	public StorageDTO(String storage_id, int schedule_id, String save_date, String schedule_detail) {
		this.storage_id = storage_id;
		this.schedule_id = schedule_id;
		this.save_date = save_date;
		this.schedule_detail = schedule_detail;
	}
	public StorageDTO(String storage_id, String schedule_detail) {
		super();
		this.storage_id = storage_id;
		this.schedule_detail = schedule_detail;
	}
	public String getStorage_id() {
		return storage_id;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public String getSave_date() {
		return save_date;
	}
	public String getSchedule_detail() {
		return schedule_detail;
	}
	@Override
	public String toString() {
		return "StorageDTO [storage_id=" + storage_id + ", schedule_id=" + schedule_id
				+ ", save_date=" + save_date + ", schedule_detail=" + schedule_detail + "]";
	}
	
	
}
