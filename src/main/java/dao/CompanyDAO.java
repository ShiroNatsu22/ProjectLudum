package dao;

import model.Company;

import java.util.List;

public interface CompanyDAO {

    List<Company> getAllCompanies();

    void createCompany(Company company);

    void deleteCompany(int company_id_pk);

}
