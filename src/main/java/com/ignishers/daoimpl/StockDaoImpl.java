package com.ignishers.daoimpl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.ignishers.dao.StockDao;
import com.ignishers.pojo.Stock;

@Repository
@Transactional
public class StockDaoImpl implements StockDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public boolean addStock(Stock stock) {
        try {
            em.persist(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateStock(Stock stock) {
        try {
            em.merge(stock);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean deleteStock(String symbol) {
        try {
            Stock stock = getStock(symbol);
            if(stock != null) {
                em.remove(stock);
                return true;
            }
        } catch (Exception e) { }
        return false;
    }

    @Override
    public Stock getStock(String symbol) {
        try {
            return em.createQuery(
                    "FROM Stock WHERE symbol=:sym", Stock.class)
                    .setParameter("sym", symbol)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Stock> getAllStocks() {
        return em.createQuery("FROM Stock", Stock.class).getResultList();
    }
}