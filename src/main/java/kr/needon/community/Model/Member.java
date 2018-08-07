package kr.needon.community.Model;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

//=====================================
//클래스 설명 : 회원관리 모델 클래스
//작성자 : 김현우
//=====================================

@Data
public class Member implements UserDetails {

    private static final long serialVersionUID = 1L;

    private int no;
    private String username;
    private String password;
    private String name;
    private String nick;
    private String phone;
    private String birth;
    private int sex;
    private String email;
    private String address1;
    private String address2;
    private int post;
    private String profile;
    private String email_ck;
    private int point;
    private String follow;
    private String photo;
    private int level;
    private int exp;
    private int msg_ck;
    private Timestamp register_date;
    private Timestamp last_date;
    private boolean enabled;
    List<UserRole> getUserRole;
    
    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (UserRole role : getUserRole) {
            authorities.add(new SimpleGrantedAuthority(role.getRole()));
        }
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.enabled;
    }

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
    
    

    
}
