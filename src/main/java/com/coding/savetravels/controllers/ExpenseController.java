package com.coding.savetravels.controllers;

import com.coding.savetravels.models.Expense;
import com.coding.savetravels.services.ExpenseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/expenses")
public class ExpenseController {
    private final ExpenseService expenseService;

    public ExpenseController(ExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @GetMapping("")
    public String index(@ModelAttribute("expense") Expense expense, Model model){
        model.addAttribute("allExpenses", expenseService.findAllExpenses());
        return "expenses.jsp";
    }

    @PostMapping("")
    public String newExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model){
        if(result.hasErrors()){
            model.addAttribute("allExpenses", expenseService.findAllExpenses());
            return "expenses.jsp";
        }
        else{
            expenseService.createExpense(expense);
            return "redirect:/expenses";
        }
    }

    @GetMapping("/show/{id}")
    public String showExpense(@PathVariable("id")Long id, Model model){
        model.addAttribute("expense", expenseService.findOneExpense(id));
        return "show.jsp";
    }

    @GetMapping("/edit/{id}")
    public String editExpense(@PathVariable("id")Long id, @ModelAttribute("expense") Expense expense, Model model){
        model.addAttribute("expense", expenseService.findOneExpense(id));
        return "edit.jsp";
    }

    @PutMapping("/update/{id}")
    public String updateExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result){
        if(result.hasErrors()){
            return "edit.jsp";
        }else {
            expenseService.updateExpense(expense);
            return "redirect:/expenses";
        }
    }

    @DeleteMapping("/delete/{id}")
    public String deleteExpense(@PathVariable("id")Long id){
        expenseService.deleteExpense(id);
        return "redirect:/expenses";
    }

}

