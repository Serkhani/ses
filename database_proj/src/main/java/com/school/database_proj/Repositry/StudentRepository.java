package com.school.database_proj.Repositry;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.school.database_proj.models.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {

}


