import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/transaction_model.dart';
import '../models/category_model.dart';

class FinanceProvider extends ChangeNotifier {
  List<TransactionModel> _transactions = [];
  List<CategoryModel> _categories = [];
  
  double _totalIncome = 0;
  double _totalExpense = 0;
  double _currentBalance = 0;

  List<TransactionModel> get transactions => _transactions;
  List<CategoryModel> get categories => _categories;
  double get totalIncome => _totalIncome;
  double get totalExpense => _totalExpense;
  double get currentBalance => _currentBalance;

  FinanceProvider() {
    _loadData();
  }

  void _calculateTotals() {
    _totalIncome = 0;
    _totalExpense = 0;
    
    for (var tx in _transactions) {
      if (tx.isIncome) {
        _totalIncome += tx.amount;
      } else {
        _totalExpense += tx.amount;
      }
    }
    
    _currentBalance = _totalIncome - _totalExpense;
    notifyListeners();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load Categories
    final categoriesStr = prefs.getStringList('categories');
    if (categoriesStr != null) {
      _categories = categoriesStr.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      // Default categories if empty
      _categories = [
        CategoryModel(id: 'c1', name: 'Makanan & Minuman', iconCodePoint: Icons.restaurant.codePoint, colorValue: 0xFF2E7D32),
        CategoryModel(id: 'c2', name: 'Transportasi', iconCodePoint: Icons.directions_car.codePoint, colorValue: 0xFF1B1464),
        CategoryModel(id: 'c3', name: 'Gaji', iconCodePoint: Icons.payments.codePoint, colorValue: 0xFF2E7D32),
        CategoryModel(id: 'c4', name: 'Belanja', iconCodePoint: Icons.shopping_bag.codePoint, colorValue: 0xFF4527A0),
      ];
      _saveCategories();
    }

    // Load Transactions
    final transactionsStr = prefs.getStringList('transactions');
    if (transactionsStr != null) {
      _transactions = transactionsStr.map((e) => TransactionModel.fromJson(e)).toList();
      // Sort by date descending (newest first)
      _transactions.sort((a, b) => b.date.compareTo(a.date));
    }
    
    _calculateTotals();
  }

  Future<void> _saveTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> transactionsStr = _transactions.map((e) => e.toJson()).toList();
    await prefs.setStringList('transactions', transactionsStr);
  }

  Future<void> _saveCategories() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> categoriesStr = _categories.map((e) => e.toJson()).toList();
    await prefs.setStringList('categories', categoriesStr);
  }

  void addTransaction(TransactionModel tx) {
    _transactions.insert(0, tx); // Add to top
    _transactions.sort((a, b) => b.date.compareTo(a.date));
    _saveTransactions();
    _calculateTotals();
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((tx) => tx.id == id);
    _saveTransactions();
    _calculateTotals();
  }

  void addCategory(CategoryModel cat) {
    _categories.add(cat);
    _saveCategories();
    notifyListeners();
  }
}
