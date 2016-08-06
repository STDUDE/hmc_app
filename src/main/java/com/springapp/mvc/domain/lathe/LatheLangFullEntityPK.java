package com.springapp.mvc.domain.lathe;

import com.springapp.mvc.domain.common.LanguageEntity;

import javax.persistence.*;
import java.io.Serializable;

@Embeddable
public class LatheLangFullEntityPK implements Serializable {
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "language_lang", referencedColumnName = "lang", nullable = false)
    private LanguageEntity language;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "lathe_full_productId", referencedColumnName = "productId", nullable = false)
    private LatheFullEntity latheFull;

    public LatheFullEntity getLatheFull() {
        return latheFull;
    }

    public void setLatheFull(LatheFullEntity latheFull) {
        this.latheFull = latheFull;
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
        if (!(o instanceof LatheLangFullEntityPK)) return false;

        LatheLangFullEntityPK that = (LatheLangFullEntityPK) o;

        if (!language.getLang().equals(that.language.getLang())) return false;
        if (!latheFull.getProductId().equals(that.latheFull.getProductId())) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = language.getLang().hashCode();
        result = 31 * result + latheFull.getProductId().hashCode();
        return result;
    }
}
