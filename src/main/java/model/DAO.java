package model;

import java.util.List;

public interface DAO {
    void create(Object obj);

    List<?> read();
}
