package onlie_test_web_app.config;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import onlie_test_web_app.entity.User;
import onlie_test_web_app.repo.UserRepo;

import java.io.IOException;
import java.util.*;

@WebFilter(filterName = "checkFilter",urlPatterns = {"/*",})

public class SecurityFilter implements Filter {
    List<String> urls = new ArrayList<>(List.of(
            "/",
            "/login.jsp",
            "/auth/login",
            "/signUp.jsp",
            "/auth/signUp",
            "/profile.jsp",
            "/auth/logout",
            "/index.jsp",
            "/users/checkEmail.jsp",
            "/auth/check/email",
            "/errPage.jsp"
    ));
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        UserRepo userRepo = new UserRepo();

        String requestURI = req.getRequestURI();
        if (urls.contains(requestURI)) {
            filterChain.doFilter(req, servletResponse);
            return;
        }

        HttpSession session = req.getSession();
        Object object = session.getAttribute("currentUser");

        if (object == null) {
            Optional<Cookie> cookieOptional =
                    Arrays.stream(req.getCookies()).
                            filter(cookie -> cookie.getName().equals("currentUser")).findFirst();

            if (cookieOptional.isPresent()) {
                System.out.println("Cookie found");
                Cookie cookie = cookieOptional.get();
                UUID userId = UUID.fromString(cookie.getValue());
                User user = userRepo.findById(userId);

                session.setAttribute("currentUser", user);
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }else {
                resp.sendRedirect("/404");
                return;
            }
        }
        filterChain.doFilter(req, servletResponse);


    }
}