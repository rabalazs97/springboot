package com.example.onlab.api;

import com.example.onlab.model.Person;
import com.example.onlab.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RequestMapping("person")
@RestController
public class PersonController {

    private final PersonService personService;

    @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }

    @GetMapping
    public List<Person> getAllPeople(){
        return personService.getAllPeople();
    }

    @GetMapping(path = "{id}")
    public Optional<Person> getPersonById(@PathVariable("id") Long id){
        return personService.getById(id);
    }

    @PostMapping
    public void addPerson(@RequestBody Person person){
        personService.addPerson(person);
    }

    @DeleteMapping(path = "{id}")
    public void deletePerson(@PathVariable("id") Long id){
        personService.deletePerson(id);
    }

    @PutMapping(path = "{id}")
    public void updatePerson(@PathVariable("id") Long id, @RequestParam(required = false) String name){
        personService.updatePerson(id, name);
    }
}
