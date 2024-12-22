package com.nguyengiap.locket.service.authenticate_service;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

import com.nguyengiap.locket.config.jwt_config.JwtService;
import com.nguyengiap.locket.model.request_model.authenticate_request_model.AuthenticateRequestModel;
import com.nguyengiap.locket.model.response_model.authentication_response.AuthenticateReponse;
import com.nguyengiap.locket.repository.user_repository.UserRepository;

import lombok.*;

@RequiredArgsConstructor
@Service
public class AuthenticateService {

    private final AuthenticationManager authenticationManager;

    private final UserRepository userRepository;

    private final JwtService jwtService;

    public AuthenticateReponse authenticate(AuthenticateRequestModel request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getAccount(),
                        request.getPassword()));
        var user = userRepository.findByAccount(request.getAccount())
                .orElseThrow();
        var jwtToken = jwtService.generateTokenWithUserDetails(user);

        return AuthenticateReponse.builder()
                .token(jwtToken)
                .account(user.getAccount())
                .build();
    }
}
