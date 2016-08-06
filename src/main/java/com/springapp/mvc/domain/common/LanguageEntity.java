package com.springapp.mvc.domain.common;

import javax.persistence.*;

@NamedQuery(name = "listLanguage", query = "from LanguageEntity")
@Entity
@Table(name = "language", schema = "", catalog = "common")
public class LanguageEntity {
    private String lang;

    public LanguageEntity() {}

    public LanguageEntity(String lang) {
        setLang(lang);
    }

    @Id
    @Column(name = "lang", nullable = false, insertable = true, updatable = true, length = 2)
    public String getLang() {
        return lang;
    }

    public void setLang(String lang) {
        this.lang = lang;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        LanguageEntity that = (LanguageEntity) o;

        if (lang != null ? !lang.equals(that.lang) : that.lang != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return lang != null ? lang.hashCode() : 0;
    }
}
