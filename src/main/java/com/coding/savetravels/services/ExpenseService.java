package com.coding.savetravels.services;


import com.coding.savetravels.models.Expense;
import com.coding.savetravels.repositories.ExpenseRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ExpenseService {
    private final ExpenseRepository expenseRepository;


    public ExpenseService(ExpenseRepository expenseRepository) {
        this.expenseRepository = expenseRepository;
    }

    public List<Expense> findAllExpenses(){
        return expenseRepository.findAll();
    }

    public Expense createExpense(Expense e){
        return expenseRepository.save(e);
    }

    public Expense findOneExpense(Long id) {
        Optional<Expense> myExpense = expenseRepository.findById(id);
        if (myExpense.isPresent()) {
            return myExpense.get();
        } else {
            return null;
        }
    }

    public Expense updateExpense(Expense expense) {
        Expense myExpense = this.findOneExpense(expense.getId());
        if(myExpense == null) {
            return null;
        }
        myExpense.setExpenseName(expense.getExpenseName());
        myExpense.setVendor(expense.getVendor());
        myExpense.setAmount(expense.getAmount());
        myExpense.setDescription(expense.getDescription());
        return expenseRepository.save(myExpense);
    }

    public void deleteExpense(Long id) {
        expenseRepository.deleteById(id);
    }
}
