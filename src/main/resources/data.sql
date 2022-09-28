/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : auth-he

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 28/09/2022 10:24:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authorization
-- ----------------------------
DROP TABLE IF EXISTS `authorization`;
CREATE TABLE `authorization` (
  `id` varchar(255) NOT NULL,
  `access_token_expires_at` datetime(6) DEFAULT NULL,
  `access_token_issued_at` datetime(6) DEFAULT NULL,
  `access_token_metadata` text,
  `access_token_scopes` text,
  `access_token_type` varchar(255) DEFAULT NULL,
  `access_token_value` text,
  `attributes` text,
  `authorization_code_expires_at` datetime(6) DEFAULT NULL,
  `authorization_code_issued_at` datetime(6) DEFAULT NULL,
  `authorization_code_metadata` varchar(255) DEFAULT NULL,
  `authorization_code_value` text,
  `authorization_grant_type` varchar(255) DEFAULT NULL,
  `oidc_id_token_claims` text,
  `oidc_id_token_expires_at` datetime(6) DEFAULT NULL,
  `oidc_id_token_issued_at` datetime(6) DEFAULT NULL,
  `oidc_id_token_metadata` text,
  `oidc_id_token_value` text,
  `principal_name` varchar(255) DEFAULT NULL,
  `refresh_token_expires_at` datetime(6) DEFAULT NULL,
  `refresh_token_issued_at` datetime(6) DEFAULT NULL,
  `refresh_token_metadata` text,
  `refresh_token_value` text,
  `registered_client_id` varchar(255) DEFAULT NULL,
  `state` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of authorization
-- ----------------------------

-- ----------------------------
-- Table structure for authorization_consent
-- ----------------------------
DROP TABLE IF EXISTS `authorization_consent`;
CREATE TABLE `authorization_consent` (
  `principal_name` varchar(255) NOT NULL,
  `registered_client_id` varchar(255) NOT NULL,
  `authorities` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`principal_name`,`registered_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of authorization_consent
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` varchar(255) NOT NULL,
  `authorization_grant_types` varchar(1000) DEFAULT NULL,
  `client_authentication_methods` varchar(1000) DEFAULT NULL,
  `client_id` varchar(255) DEFAULT NULL,
  `client_id_issued_at` datetime(6) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_secret` varchar(255) DEFAULT NULL,
  `client_secret_expires_at` datetime(6) DEFAULT NULL,
  `client_settings` varchar(2000) DEFAULT NULL,
  `redirect_uris` varchar(1000) DEFAULT NULL,
  `scopes` varchar(1000) DEFAULT NULL,
  `token_settings` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of client
-- ----------------------------
BEGIN;
INSERT INTO `client` (`id`, `authorization_grant_types`, `client_authentication_methods`, `client_id`, `client_id_issued_at`, `client_name`, `client_secret`, `client_secret_expires_at`, `client_settings`, `redirect_uris`, `scopes`, `token_settings`) VALUES ('67de38bd-a0ae-43e9-96d3-6f0c01ae8ab4', 'refresh_token,client_credentials,authorization_code', 'client_secret_basic', 'messaging-client', NULL, '67de38bd-a0ae-43e9-96d3-6f0c01ae8ab4', '{noop}secret', NULL, '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}', 'http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc,http://127.0.0.1:8080/authorized', 'openid,message.read,message.write', '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.access-token-format\":{\"@class\":\"org.springframework.security.oauth2.core.OAuth2TokenFormat\",\"value\":\"self-contained\"},\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}');
-- INSERT INTO `client` (`id`, `authorization_grant_types`, `client_authentication_methods`, `client_id`, `client_id_issued_at`, `client_name`, `client_secret`, `client_secret_expires_at`, `client_settings`, `redirect_uris`, `scopes`, `token_settings`) VALUES ('a73cdcfd-f4ca-458a-91be-0cb26b7ebc94', 'authorization_code,refresh_token,client_credentials', 'client_secret_basic', 'messaging-client', '2022-09-15 16:51:34.987964', 'name', '{noop}secret', NULL, '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}', 'http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc,http://127.0.0.1:8080/authorized', 'openid,message.read,message.write', '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
