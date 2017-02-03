package Entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by qingyutan on 2/2/17.
 */
@Entity
public class Faq {
    private int id;
    private String subject;
    private String shortdesc;
    private String articledesc;
    private Integer articleid;

    public Faq() {
    }

    public Faq(String subject, String shortdesc, String articledesc, Integer articleid) {
        this.subject = subject;
        this.shortdesc = shortdesc;
        this.articledesc = articledesc;
        this.articleid = articleid;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "subject")
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Basic
    @Column(name = "shortdesc")
    public String getShortdesc() {
        return shortdesc;
    }

    public void setShortdesc(String shortdesc) {
        this.shortdesc = shortdesc;
    }

    @Basic
    @Column(name = "articledesc")
    public String getArticledesc() {
        return articledesc;
    }

    public void setArticledesc(String articledesc) {
        this.articledesc = articledesc;
    }

    @Basic
    @Column(name = "articleid")
    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Faq faq = (Faq) o;

        if (id != faq.id) return false;
        if (subject != null ? !subject.equals(faq.subject) : faq.subject != null) return false;
        if (shortdesc != null ? !shortdesc.equals(faq.shortdesc) : faq.shortdesc != null) return false;
        if (articledesc != null ? !articledesc.equals(faq.articledesc) : faq.articledesc != null) return false;
        if (articleid != null ? !articleid.equals(faq.articleid) : faq.articleid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (subject != null ? subject.hashCode() : 0);
        result = 31 * result + (shortdesc != null ? shortdesc.hashCode() : 0);
        result = 31 * result + (articledesc != null ? articledesc.hashCode() : 0);
        result = 31 * result + (articleid != null ? articleid.hashCode() : 0);
        return result;
    }
}
