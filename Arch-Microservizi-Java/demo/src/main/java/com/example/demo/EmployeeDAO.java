package com.example.demo;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class EmployeeDAO {

	
	@Autowired
    private EmployeeRepository employeeRepository;

    // Metodo per ottenere tutti gli impiegati
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    // Metodo per aggiungere un impiegato
    public void addEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    // Metodo per ottenere un impiegato tramite ID
    public Optional<Employee> getEmployee(Integer id) {
        return employeeRepository.findById(id);
    }

    // Metodo per eliminare un impiegato
    public void delEmployee(Integer id) {
        employeeRepository.deleteById(id);
    }
}