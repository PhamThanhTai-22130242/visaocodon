package com.baya.baya_project.service;

import com.baya.baya_project.Dao.ContactDao;
import com.baya.baya_project.Dao.OrderDao;
import com.baya.baya_project.Model.Contact;
import static com.baya.baya_project.Dao.JDBIConnector.jdbi;

import java.util.List;

public class ContactService {

    ContactDao dao;

    public ContactService(){
        dao = new ContactDao();
    }


    public boolean insertContact(Contact contact){
        return dao.insert(contact) > 0;
    }

    public List<Contact> getAllContacts(){
        return dao.selectAll();
    }

    public int delete(int contactId) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate("DELETE FROM contact WHERE contactID = ?")
                    .bind(0, contactId)
                    .execute();
        });
    }



}
