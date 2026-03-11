package com.ignishers.dao;

import java.util.List;
import com.ignishers.pojo.Stock;

public interface StockDao {

    boolean addStock(Stock stock);

    boolean updateStock(Stock stock);

    boolean deleteStock(String symbol);

    Stock getStock(String symbol);

    List<Stock> getAllStocks();
}
