package model;

import java.util.Date;

public class Company {

    private int company_id_pk;
    private String name;
    private Date founded;

    public Company() {
    }

    public Company(int company_id_pk, String name, Date founded) {
        this.company_id_pk = company_id_pk;
        this.name = name;
        this.founded = founded;
    }

    public int getCompany_id_pk() {
        return company_id_pk;
    }

    public void setCompany_id_pk(int company_id_pk) {
        this.company_id_pk = company_id_pk;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getFounded() {
        return founded;
    }

    public void setFounded(Date founded) {
        this.founded = founded;
    }
}
