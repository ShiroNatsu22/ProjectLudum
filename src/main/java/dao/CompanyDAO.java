package dao;

import model.Company;

import java.util.List;

public interface CompanyDAO {

    List<Company> getAllCompanies();

    Company getCompanyByID(int company_id_pk);

    int createCompany(Company company);

    void deleteCompany(int company_id_pk);

}
