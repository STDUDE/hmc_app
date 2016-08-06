package com.springapp.mvc.domain.lathe;

import com.springapp.mvc.domain.common.LanguageEntity;

import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
public class LatheLangShortEntityPK implements Serializable{
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "language_lang", referencedColumnName = "lang", nullable = false)
    private LanguageEntity language;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "lathe_short_productId", referencedColumnName = "productId", nullable = false)
    private LatheShortEntity latheShort;

    public LatheShortEntity getLatheShort() {
        return latheShort;
    }

    public void setLatheShort(LatheShortEntity latheShort) {
        this.latheShort = latheShort;
    }

    public LanguageEntity getLanguage() {
        return language;
    }

    public void setLanguage(LanguageEntity language) {
        this.language = language;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof LatheLangShortEntityPK)) return false;

        LatheLangShortEntityPK that = (LatheLangShortEntityPK) o;

        if (!language.getLang().equals(that.language.getLang())) return false;
        if (!latheShort.getProductId().equals(that.latheShort.getProductId())) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = language.getLang().hashCode();
        result = 31 * result + latheShort.getProductId().hashCode();
        return result;
    }
}
