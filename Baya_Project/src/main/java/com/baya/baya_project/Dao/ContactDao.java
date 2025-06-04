package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.Contact;
import org.jdbi.v3.core.Jdbi;

import java.util.List;

public class ContactDao implements DaoInterface<Contact>{

    private Jdbi jdbi;
    public ContactDao() {
        jdbi = JDBIConnector.getJdbi();
    }


    @Override
    public List<Contact> selectAll() {
        return jdbi.withHandle(
                handle -> {
                    return handle.createQuery("select * from contact").mapToBean(Contact.class).list();
                }
        );
    }

    @Override
    public Contact selectById(String id) {
        return null;
    }

    @Override
    public Contact selectById(int id) {
        return null;
    }

    @Override
    public int insert(Contact contact) {
        return jdbi.withHandle(handle -> {
            return handle.createUpdate(
                            "INSERT INTO contact (fullname, phoneNumber, email, message, sentTime, userID) VALUES (?, ?, ?, ?, ?, ?)"
                    )
                    .bind(0, contact.getFullname())
                    .bind(1, contact.getPhoneNumber())
                    .bind(2, contact.getEmail())
                    .bind(3, contact.getMessage())
                    .bind(4, contact.getSentTime())
                    .bind(5, contact.getUserID())
                    .execute();
        });
    }

    @Override
    public int update(Contact contact) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE contact SET status = :status, replyMessage = :replyMessage, replyTime = :replyTime WHERE contactID = :contactID")
                        .bind("status", contact.getStatus())
                        .bind("replyMessage", contact.getReplyMessage())
                        .bind("replyTime", contact.getReplyTime())
                        .bind("contactID", contact.getContactID())
                        .execute()
        );
    }


    @Override
    public int delete(String id) {
        return 0;
    }
}
