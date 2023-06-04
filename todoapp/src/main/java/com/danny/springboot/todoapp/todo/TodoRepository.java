package com.danny.springboot.todoapp.todo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepository extends JpaRepository<Todo, Integer>{

	//toDolist목록때문에 설정 
	public List<Todo> findByUsername(String username);

}
