/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : auth-he

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 16/09/2022 08:48:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for authorization
-- ----------------------------
DROP TABLE IF EXISTS `authorization`;
CREATE TABLE `authorization` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `access_token_expires_at` datetime(6) DEFAULT NULL,
  `access_token_issued_at` datetime(6) DEFAULT NULL,
  `access_token_metadata` text COLLATE utf8mb4_general_ci,
  `access_token_scopes` text COLLATE utf8mb4_general_ci,
  `access_token_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `access_token_value` text COLLATE utf8mb4_general_ci,
  `attributes` text COLLATE utf8mb4_general_ci,
  `authorization_code_expires_at` datetime(6) DEFAULT NULL,
  `authorization_code_issued_at` datetime(6) DEFAULT NULL,
  `authorization_code_metadata` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `authorization_code_value` text COLLATE utf8mb4_general_ci,
  `authorization_grant_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oidc_id_token_claims` text COLLATE utf8mb4_general_ci,
  `oidc_id_token_expires_at` datetime(6) DEFAULT NULL,
  `oidc_id_token_issued_at` datetime(6) DEFAULT NULL,
  `oidc_id_token_metadata` text COLLATE utf8mb4_general_ci,
  `oidc_id_token_value` text COLLATE utf8mb4_general_ci,
  `principal_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `refresh_token_expires_at` datetime(6) DEFAULT NULL,
  `refresh_token_issued_at` datetime(6) DEFAULT NULL,
  `refresh_token_metadata` text COLLATE utf8mb4_general_ci,
  `refresh_token_value` text COLLATE utf8mb4_general_ci,
  `registered_client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of authorization
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for authorization_consent
-- ----------------------------
DROP TABLE IF EXISTS `authorization_consent`;
CREATE TABLE `authorization_consent` (
  `principal_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `registered_client_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `authorities` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`principal_name`,`registered_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of authorization_consent
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `authorization_grant_types` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_authentication_methods` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_id_issued_at` datetime(6) DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `client_secret_expires_at` datetime(6) DEFAULT NULL,
  `client_settings` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redirect_uris` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `scopes` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `token_settings` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of client
-- ----------------------------
BEGIN;
INSERT INTO `client` (`id`, `authorization_grant_types`, `client_authentication_methods`, `client_id`, `client_id_issued_at`, `client_name`, `client_secret`, `client_secret_expires_at`, `client_settings`, `redirect_uris`, `scopes`, `token_settings`) VALUES ('a73cdcfd-f4ca-458a-91be-0cb26b7ebc94', 'authorization_code,refresh_token,client_credentials', 'client_secret_basic', 'message-client', '2022-09-15 16:51:34.987964', 'name', '{noop}secret', NULL, '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.client.require-proof-key\":false,\"settings.client.require-authorization-consent\":true}', 'http://127.0.0.1:8080/login/oauth2/code/messaging-client-oidc,http://127.0.0.1:8080/authorized', 'openid,message.read,message.write', '{\"@class\":\"java.util.Collections$UnmodifiableMap\",\"settings.token.reuse-refresh-tokens\":true,\"settings.token.id-token-signature-algorithm\":[\"org.springframework.security.oauth2.jose.jws.SignatureAlgorithm\",\"RS256\"],\"settings.token.access-token-time-to-live\":[\"java.time.Duration\",300.000000000],\"settings.token.refresh-token-time-to-live\":[\"java.time.Duration\",3600.000000000]}');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
