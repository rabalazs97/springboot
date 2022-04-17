package com.example.onlab.service;

import com.example.onlab.repo.PersonRepository;
import com.example.onlab.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class PersonService {

    private final PersonRepository personRepository;

    @Autowired
    public PersonService(PersonRepository personRepository) {
        this.personRepository = personRepository;
    }

    public List<Person> getAllPeople(){
        return personRepository.findAll();
    }

    public Optional<Person> getById(Long id){
        return personRepository.findById(id);
    }

    public void addPerson(Person person) {
        personRepository.save(person);
    }

    public void deletePerson(Long id) {
        boolean exists = personRepository.existsById(id);
        if(!exists){
            throw new IllegalStateException("person with id " + id + " does not exist");
        }
        else {
            personRepository.deleteById(id);
        }
    }

    @Transactional //so we don't need any queries, it's all automatically managed
    public void updatePerson(Long id, String name) {
        Person person = personRepository.findById(id)
                .orElseThrow(() -> new IllegalStateException("person with id " + id + " does not exist"));
        if(name != null && name.length() > 0 && !Objects.equals(person.getName(), name)){
            person.setName(name);
        }
    }
}
