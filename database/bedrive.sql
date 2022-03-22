/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : bedrive

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 22/03/2022 09:34:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for billing_plans
-- ----------------------------
DROP TABLE IF EXISTS `billing_plans`;
CREATE TABLE `billing_plans`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(13, 2) NULL DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `interval` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `interval_count` int(11) NOT NULL DEFAULT 1,
  `parent_id` int(11) NULL DEFAULT NULL,
  `legacy_permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `free` tinyint(1) NOT NULL DEFAULT 0,
  `show_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `features` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `billing_plans_hidden_index`(`hidden`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of billing_plans
-- ----------------------------
INSERT INTO `billing_plans` VALUES (1, 'Plane A', 1.00, 'USD', '$', 'month', 1, NULL, NULL, '5eoiCX4IiCut7H4U2JahfZbl8ckG68V8YwJH', NULL, 1, 1, 1, '[]', 1, '2022-03-21 07:22:36', '2022-03-21 07:22:36', 2147483648, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comments_parent_id_index`(`parent_id`) USING BTREE,
  INDEX `comments_path_index`(`path`) USING BTREE,
  INDEX `comments_user_id_index`(`user_id`) USING BTREE,
  INDEX `comments_commentable_id_index`(`commentable_id`) USING BTREE,
  INDEX `comments_commentable_type_index`(`commentable_type`) USING BTREE,
  INDEX `comments_deleted_index`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for css_themes
-- ----------------------------
DROP TABLE IF EXISTS `css_themes`;
CREATE TABLE `css_themes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_dark` tinyint(1) NOT NULL DEFAULT 0,
  `default_light` tinyint(1) NOT NULL DEFAULT 0,
  `default_dark` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `colors` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `css_themes_name_unique`(`name`) USING BTREE,
  INDEX `css_themes_default_light_index`(`default_light`) USING BTREE,
  INDEX `css_themes_default_dark_index`(`default_dark`) USING BTREE,
  INDEX `css_themes_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of css_themes
-- ----------------------------
INSERT INTO `css_themes` VALUES (1, 'Dark', 1, 0, 1, 1, '{\"--be-primary-lighter\":\"#3f3f3f\",\"--be-primary-default\":\"#1D1D1D\",\"--be-primary-darker\":\"#181c26\",\"--be-accent-default\":\"#8AB2E0\",\"--be-accent-lighter\":\"#B9D1EC\",\"--be-accent-contrast\":\"rgba(255, 255, 255, 1)\",\"--be-accent-emphasis\":\"rgba(185, 209, 236, 0.1)\",\"--be-foreground-base\":\"#fff\",\"--be-text\":\"#fff\",\"--be-hint-text\":\"rgba(255, 255, 255, 0.5)\",\"--be-secondary-text\":\"rgba(255, 255, 255, 0.7)\",\"--be-label\":\"rgba(255, 255, 255, 0.7)\",\"--be-background\":\"#1D1D1D\",\"--be-background-alternative\":\"#121212\",\"--be-divider-lighter\":\"rgba(255, 255, 255, 0.06)\",\"--be-divider-default\":\"rgba(255, 255, 255, 0.12)\",\"--be-disabled-button-text\":\"rgba(255, 255, 255, 0.3)\",\"--be-disabled-toggle\":\"#000\",\"--be-chip\":\"#616161\",\"--be-hover\":\"rgba(255, 255, 255, 0.04)\",\"--be-selected-button\":\"#212121\",\"--be-disabled-button\":\"rgba(255, 255, 255, 0.12)\",\"--be-raised-button\":\"#424242\",\"--be-backdrop\":\"#BDBDBD\",\"--be-link\":\"#c5cae9\"}', '2022-03-21 04:53:34', '2022-03-21 04:53:34');
INSERT INTO `css_themes` VALUES (2, 'Light', 0, 1, 0, 1, '{\"--be-primary-lighter\":\"#3e4a66\",\"--be-primary-default\":\"#2B3346\",\"--be-primary-darker\":\"#181c26\",\"--be-accent-default\":\"#1565C0\",\"--be-accent-lighter\":\"#B9D1EC\",\"--be-accent-contrast\":\"rgba(255, 255, 255, 1)\",\"--be-accent-emphasis\":\"rgba(185, 209, 236, 0.15)\",\"--be-background\":\"rgb(255, 255, 255)\",\"--be-background-alternative\":\"rgb(250, 250, 250)\",\"--be-foreground-base\":\"black\",\"--be-text\":\"rgba(0, 0, 0, 0.87)\",\"--be-hint-text\":\"rgba(0, 0, 0, 0.38)\",\"--be-secondary-text\":\"rgba(0, 0, 0, 0.54)\",\"--be-label\":\"rgba(0, 0, 0, 0.87)\",\"--be-disabled-button-text\":\"rgba(0, 0, 0, 0.26)\",\"--be-divider-lighter\":\"rgba(0, 0, 0, 0.06)\",\"--be-divider-default\":\"rgba(0, 0, 0, 0.12)\",\"--be-hover\":\"rgba(0,0,0,0.04)\",\"--be-selected-button\":\"rgb(224, 224, 224)\",\"--be-chip\":\"#e0e0e0\",\"--be-link\":\"#3f51b5\",\"--be-backdrop\":\"black\",\"--be-raised-button\":\"#fff\",\"--be-disabled-toggle\":\"rgb(238, 238, 238)\",\"--be-disabled-button\":\"rgba(0, 0, 0, 0.12)\"}', '2022-03-21 04:53:34', '2022-03-21 04:53:34');
INSERT INTO `css_themes` VALUES (3, 'Cyan', 0, 0, 0, 1, '{\"--be-primary-lighter\":\"#3e4a66\",\"--be-primary-default\":\"#2B3346\",\"--be-primary-darker\":\"#181c26\",\"--be-accent-default\":\"rgba(16,210,193,1)\",\"--be-accent-lighter\":\"rgba(11,159,127,1)\",\"--be-accent-contrast\":\"rgba(241,241,241,1)\",\"--be-accent-emphasis\":\"rgba(128,253,252,0.15)\",\"--be-background\":\"rgb(255, 255, 255)\",\"--be-background-alternative\":\"rgb(250, 250, 250)\",\"--be-foreground-base\":\"rgba(27,175,137,1)\",\"--be-text\":\"rgba(0, 0, 0, 0.87)\",\"--be-hint-text\":\"rgba(0, 0, 0, 0.38)\",\"--be-secondary-text\":\"rgba(0, 0, 0, 0.54)\",\"--be-label\":\"rgba(0, 0, 0, 0.87)\",\"--be-disabled-button-text\":\"rgba(0, 0, 0, 0.26)\",\"--be-divider-lighter\":\"rgba(0, 0, 0, 0.06)\",\"--be-divider-default\":\"rgba(16,206,224,0.12)\",\"--be-hover\":\"rgba(0,0,0,0.04)\",\"--be-selected-button\":\"rgb(224, 224, 224)\",\"--be-chip\":\"#e0e0e0\",\"--be-link\":\"#3f51b5\",\"--be-backdrop\":\"black\",\"--be-raised-button\":\"#fff\",\"--be-disabled-toggle\":\"rgb(238, 238, 238)\",\"--be-disabled-button\":\"rgba(0, 0, 0, 0.12)\"}', '2022-03-21 12:50:58', '2022-03-21 12:53:35');

-- ----------------------------
-- Table structure for csv_exports
-- ----------------------------
DROP TABLE IF EXISTS `csv_exports`;
CREATE TABLE `csv_exports`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cache_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `download_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `csv_exports_cache_name_unique`(`cache_name`) USING BTREE,
  INDEX `csv_exports_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csv_exports
-- ----------------------------
INSERT INTO `csv_exports` VALUES (2, 'users', 1, 'users.csv', '6b19d837-f1ae-49d0-8fef-c0c54f1bb9db', '2022-03-21 12:45:04', '2022-03-21 12:45:04');

-- ----------------------------
-- Table structure for custom_domains
-- ----------------------------
DROP TABLE IF EXISTS `custom_domains`;
CREATE TABLE `custom_domains`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT 0,
  `resource_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `resource_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `custom_domains_host_unique`(`host`) USING BTREE,
  INDEX `custom_domains_user_id_index`(`user_id`) USING BTREE,
  INDEX `custom_domains_created_at_index`(`created_at`) USING BTREE,
  INDEX `custom_domains_updated_at_index`(`updated_at`) USING BTREE,
  INDEX `custom_domains_global_index`(`global`) USING BTREE,
  INDEX `custom_domains_resource_id_index`(`resource_id`) USING BTREE,
  INDEX `custom_domains_resource_type_index`(`resource_type`) USING BTREE,
  INDEX `custom_domains_workspace_id_index`(`workspace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_domains
-- ----------------------------

-- ----------------------------
-- Table structure for custom_pages
-- ----------------------------
DROP TABLE IF EXISTS `custom_pages`;
CREATE TABLE `custom_pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `hide_nav` tinyint(1) NOT NULL DEFAULT 0,
  `workspace_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE,
  INDEX `pages_type_index`(`type`) USING BTREE,
  INDEX `pages_user_id_index`(`user_id`) USING BTREE,
  INDEX `custom_pages_workspace_id_index`(`workspace_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_pages
-- ----------------------------
INSERT INTO `custom_pages` VALUES (1, 'Privacy Policy', '<h1>Example Privacy Policy</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'privacy-policy', NULL, 'default', '2022-03-21 04:53:34', '2022-03-21 04:53:34', NULL, 0, NULL);
INSERT INTO `custom_pages` VALUES (2, 'Terms of Service', '<h1>Example Terms of Service</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'terms-of-service', NULL, 'default', '2022-03-21 04:53:34', '2022-03-21 04:53:34', NULL, 0, NULL);
INSERT INTO `custom_pages` VALUES (3, 'About Us', '<h1>Example About Us</h1><p>The standard Lorem Ipsum passage, used since the 1500s\n    \"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p>\n\n<p>Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p>\n\n<p>1914 translation by H. Rackham\n    \"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>\n\n<p>Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\n    \"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p>\n\n<p>1914 translation by H. Rackham\n    \"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', 'about-us', NULL, 'default', '2022-03-21 04:53:34', '2022-03-21 04:53:34', NULL, 0, NULL);

-- ----------------------------
-- Table structure for fcm_tokens
-- ----------------------------
DROP TABLE IF EXISTS `fcm_tokens`;
CREATE TABLE `fcm_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `device_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fcm_tokens_device_id_user_id_unique`(`device_id`, `user_id`) USING BTREE,
  INDEX `fcm_tokens_device_id_index`(`device_id`) USING BTREE,
  INDEX `fcm_tokens_token_index`(`token`) USING BTREE,
  INDEX `fcm_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fcm_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for file_entries
-- ----------------------------
DROP TABLE IF EXISTS `file_entries`;
CREATE TABLE `file_entries`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  `disk_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `extension` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `preview_token` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `thumbnail` tinyint(1) NOT NULL DEFAULT 0,
  `workspace_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `files_user_id_index`(`user_id`) USING BTREE,
  INDEX `files_folder_id_index`(`parent_id`) USING BTREE,
  INDEX `file_entries_name_index`(`name`) USING BTREE,
  INDEX `file_entries_path_index`(`path`) USING BTREE,
  INDEX `file_entries_type_index`(`type`) USING BTREE,
  INDEX `file_entries_public_index`(`public`) USING BTREE,
  INDEX `file_entries_description_index`(`description`) USING BTREE,
  INDEX `file_entries_workspace_id_index`(`workspace_id`) USING BTREE,
  INDEX `file_entries_owner_id_index`(`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_entries
-- ----------------------------
INSERT INTO `file_entries` VALUES (1, 'INV.PNG', NULL, 'Q4FKE9Dr1ZRYMawPac59RTURrav1exR466cJwIcS', 'image/png', 73335, NULL, NULL, '2022-03-21 04:55:30', '2022-03-21 04:55:30', NULL, '1', NULL, 'image', 'PNG', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (2, 'laravel-9.png', NULL, 'PrXjc6SxrPGEWqC4WwxMEfd6HshBrK6XNFIzZnML', 'image/png', 36937, NULL, NULL, '2022-03-21 04:55:30', '2022-03-21 04:55:30', NULL, '2', NULL, 'image', 'png', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (3, 'My File', NULL, 'My File', NULL, 92667684, NULL, NULL, '2022-03-21 04:56:30', '2022-03-21 11:47:34', NULL, '3', NULL, 'folder', NULL, 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (4, 'Nget Tim.jpg', NULL, 'ibD8hWivYgeszVlP7wKZXRwmZYSOeXe3tGNIDDmA', 'image/jpeg', 115230, NULL, 3, '2022-03-21 04:56:44', '2022-03-21 04:56:44', NULL, '3/4', NULL, 'image', 'jpg', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (5, 'filebob-130.rar', NULL, 'n5oteEyZDlBzxCCB4rTCaSh7BajAMyFSDsuUDrhV', 'application/x-rar', 46273411, NULL, 3, '2022-03-21 04:58:07', '2022-03-21 04:58:07', NULL, '3/5', NULL, 'file', 'rar', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (6, 'filebob-130.rar', NULL, 'PO2RZKtn7wmp7YIiw9hwUWnB6xP4NRqzYHc8FNgn', 'application/x-rar', 46273411, NULL, 3, '2022-03-21 04:58:27', '2022-03-21 04:58:27', NULL, '3/6', NULL, 'file', 'rar', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (7, 'laravel-9_ywe8xY5kvgr651e.png', NULL, 'MB65sEyCCZcEIHUBt7QMFG1Kul3Ds4EaINFyhUQL.png', 'image/png', 36937, NULL, NULL, '2022-03-21 06:00:14', '2022-03-21 06:00:14', NULL, NULL, 'avatars', 'image', 'png', 1, NULL, 0, 1, 1);
INSERT INTO `file_entries` VALUES (8, 'laravel-9_ywe8xY5kvgr651e.png', NULL, 'MKiekSDPYsKRlt7aLG8fOlEQt29tutyWt7vNVYIc', 'image/png', 36937, NULL, NULL, '2022-03-21 06:29:57', '2022-03-21 06:29:57', NULL, '8', NULL, 'image', 'png', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (9, 'filebob-130.rar', NULL, 'JacdH1lEzyvXT3vQN4blOqPpZstd1bSFcJM8rDlR', 'application/x-rar', 46273411, NULL, NULL, '2022-03-21 06:31:07', '2022-03-21 06:31:07', NULL, '9', NULL, 'file', 'rar', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (10, 'filebob-130.rar', NULL, 'HUdqibNmf7jMCSQDQFdvyNi1FLV4Sb6LrqmsTLl9', 'application/x-rar', 46273411, NULL, NULL, '2022-03-21 06:32:56', '2022-03-21 06:32:56', NULL, 'a', NULL, 'file', 'rar', 0, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (11, 'laravel-9_ywe8xY5kvgr651e.png', NULL, 'waOTWGM6Ah7btKSQHPidtlAWBiSJ4QyZieTwYuvd.png', 'image/png', 36937, NULL, NULL, '2022-03-21 07:02:17', '2022-03-21 07:02:17', NULL, NULL, 'avatars', 'image', 'png', 1, NULL, 0, NULL, 1);
INSERT INTO `file_entries` VALUES (12, 'laravel-9_ywe8xY5kvgr651e.png', NULL, 'K48Uija5ysllGYEPaQUG3ZNFeU9Z2Sg1i6APSi8Y', 'image/png', 36937, NULL, NULL, '2022-03-21 07:15:11', '2022-03-21 07:15:11', NULL, 'c', NULL, 'image', 'png', 0, NULL, 0, NULL, 3);
INSERT INTO `file_entries` VALUES (13, 'salesman_receive_payment_commission_report_2022_03_03_08_27_05.xls', NULL, 'vF3wAcI3q5vwpfdW2TfMQMjTenIQWUjwrXoi5mZj', 'application/vnd.ms-excel', 5632, NULL, 3, '2022-03-21 11:47:34', '2022-03-21 11:49:37', NULL, '3/d', NULL, 'spreadsheet', 'xls', 0, 'iNdXTJIbuwCITpG', 0, NULL, 1);

-- ----------------------------
-- Table structure for file_entry_models
-- ----------------------------
DROP TABLE IF EXISTS `file_entry_models`;
CREATE TABLE `file_entry_models`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_entry_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uploadables_upload_id_uploadable_id_uploadable_type_unique`(`file_entry_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `file_entry_models_owner_index`(`owner`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_entry_models
-- ----------------------------
INSERT INTO `file_entry_models` VALUES (1, 1, 1, 'App\\User', '2022-03-21 04:55:30', '2022-03-21 04:55:30', 1, NULL);
INSERT INTO `file_entry_models` VALUES (2, 2, 1, 'App\\User', '2022-03-21 04:55:30', '2022-03-21 04:55:30', 1, NULL);
INSERT INTO `file_entry_models` VALUES (3, 3, 1, 'App\\User', '2022-03-21 04:56:30', '2022-03-21 04:56:30', 1, NULL);
INSERT INTO `file_entry_models` VALUES (4, 4, 1, 'App\\User', '2022-03-21 04:56:44', '2022-03-21 04:56:44', 1, NULL);
INSERT INTO `file_entry_models` VALUES (5, 5, 1, 'App\\User', '2022-03-21 04:58:07', '2022-03-21 04:58:07', 1, NULL);
INSERT INTO `file_entry_models` VALUES (6, 6, 1, 'App\\User', '2022-03-21 04:58:27', '2022-03-21 04:58:27', 1, NULL);
INSERT INTO `file_entry_models` VALUES (7, 7, 1, 'App\\User', '2022-03-21 06:00:14', '2022-03-21 06:00:14', 1, NULL);
INSERT INTO `file_entry_models` VALUES (8, 8, 1, 'App\\User', '2022-03-21 06:29:57', '2022-03-21 06:29:57', 1, NULL);
INSERT INTO `file_entry_models` VALUES (9, 9, 1, 'App\\User', '2022-03-21 06:31:07', '2022-03-21 06:31:07', 1, NULL);
INSERT INTO `file_entry_models` VALUES (10, 10, 1, 'App\\User', '2022-03-21 06:32:56', '2022-03-21 06:32:56', 1, NULL);
INSERT INTO `file_entry_models` VALUES (11, 11, 1, 'App\\User', '2022-03-21 07:02:17', '2022-03-21 07:02:17', 1, NULL);
INSERT INTO `file_entry_models` VALUES (12, 12, 3, 'App\\User', '2022-03-21 07:15:11', '2022-03-21 07:15:11', 1, NULL);
INSERT INTO `file_entry_models` VALUES (13, 1, 3, 'App\\User', '2022-03-21 07:38:19', '2022-03-21 07:38:19', 0, '{\"edit\":false,\"view\":true,\"download\":true}');
INSERT INTO `file_entry_models` VALUES (14, 13, 1, 'App\\User', '2022-03-21 11:47:34', '2022-03-21 11:47:34', 1, NULL);

-- ----------------------------
-- Table structure for folders
-- ----------------------------
DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `folder_id` int(11) NULL DEFAULT NULL,
  `share_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `folders_user_id_index`(`user_id`) USING BTREE,
  INDEX `folders_share_id_index`(`share_id`) USING BTREE,
  INDEX `folders_folder_id_index`(`folder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of folders
-- ----------------------------

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `uuid` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `invoices_subscription_id_index`(`subscription_id`) USING BTREE,
  INDEX `invoices_uuid_index`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invoices
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_reserved_at_index`(`queue`, `reserved_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for labelables
-- ----------------------------
DROP TABLE IF EXISTS `labelables`;
CREATE TABLE `labelables`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `labelable_id` int(11) NOT NULL,
  `labelable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `labelables_label_id_labelable_id_labelable_type_unique`(`label_id`, `labelable_id`, `labelable_type`) USING BTREE,
  INDEX `labelables_labelable_id_index`(`labelable_id`) USING BTREE,
  INDEX `labelables_label_id_index`(`label_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of labelables
-- ----------------------------

-- ----------------------------
-- Table structure for labels
-- ----------------------------
DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `labels_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of labels
-- ----------------------------

-- ----------------------------
-- Table structure for localizations
-- ----------------------------
DROP TABLE IF EXISTS `localizations`;
CREATE TABLE `localizations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `localizations_name_index`(`name`) USING BTREE,
  INDEX `localizations_language_index`(`language`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of localizations
-- ----------------------------
INSERT INTO `localizations` VALUES (1, 'english', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'en');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2015_04_127_156842_create_social_profiles_table', 1);
INSERT INTO `migrations` VALUES (4, '2015_04_127_156842_create_users_oauth_table', 1);
INSERT INTO `migrations` VALUES (5, '2015_04_13_140047_create_files_models_table', 1);
INSERT INTO `migrations` VALUES (6, '2015_04_18_134312_create_folders_table', 1);
INSERT INTO `migrations` VALUES (7, '2015_05_05_131439_create_labels_table', 1);
INSERT INTO `migrations` VALUES (8, '2015_05_29_131549_create_settings_table', 1);
INSERT INTO `migrations` VALUES (9, '2015_08_08_131451_create_labelables_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_04_06_140017_add_folder_id_index_to_files_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_05_12_190852_create_tags_table', 1);
INSERT INTO `migrations` VALUES (12, '2016_05_12_190958_create_taggables_table', 1);
INSERT INTO `migrations` VALUES (13, '2016_05_26_170044_create_uploads_table', 1);
INSERT INTO `migrations` VALUES (14, '2016_05_27_143158_create_uploadables_table', 1);
INSERT INTO `migrations` VALUES (15, '2016_07_14_153703_create_groups_table', 1);
INSERT INTO `migrations` VALUES (16, '2016_07_14_153921_create_user_group_table', 1);
INSERT INTO `migrations` VALUES (17, '2016_10_17_152159_add_space_available_column_to_users_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_07_02_120142_create_pages_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_07_11_122825_create_localizations_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_08_26_131330_add_private_field_to_settings_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_09_17_144728_add_columns_to_users_table', 1);
INSERT INTO `migrations` VALUES (22, '2017_09_17_152854_make_password_column_nullable', 1);
INSERT INTO `migrations` VALUES (23, '2017_09_30_152855_make_settings_value_column_nullable', 1);
INSERT INTO `migrations` VALUES (24, '2017_10_01_152897_add_public_column_to_uploads_table', 1);
INSERT INTO `migrations` VALUES (25, '2017_12_04_132911_add_avatar_column_to_users_table', 1);
INSERT INTO `migrations` VALUES (26, '2018_01_10_140732_create_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (27, '2018_01_10_140746_add_billing_to_users_table', 1);
INSERT INTO `migrations` VALUES (28, '2018_01_10_161706_create_billing_plans_table', 1);
INSERT INTO `migrations` VALUES (29, '2018_06_05_142932_rename_files_table_to_file_entries', 1);
INSERT INTO `migrations` VALUES (30, '2018_06_06_141629_rename_file_entries_table_columns', 1);
INSERT INTO `migrations` VALUES (31, '2018_06_07_141630_merge_files_and_folders_tables', 1);
INSERT INTO `migrations` VALUES (32, '2018_07_03_114346_create_shareable_links_table', 1);
INSERT INTO `migrations` VALUES (33, '2018_07_24_113757_add_available_space_to_billing_plans_table', 1);
INSERT INTO `migrations` VALUES (34, '2018_07_24_124254_add_available_space_to_users_table', 1);
INSERT INTO `migrations` VALUES (35, '2018_07_26_142339_rename_groups_to_roles', 1);
INSERT INTO `migrations` VALUES (36, '2018_07_26_142842_rename_user_role_table_columns_to_roles', 1);
INSERT INTO `migrations` VALUES (37, '2018_08_07_124200_rename_uploads_to_file_entries', 1);
INSERT INTO `migrations` VALUES (38, '2018_08_07_124327_refactor_file_entries_columns', 1);
INSERT INTO `migrations` VALUES (39, '2018_08_07_130653_add_folder_path_column_to_file_entries_table', 1);
INSERT INTO `migrations` VALUES (40, '2018_08_07_140328_delete_legacy_root_folders', 1);
INSERT INTO `migrations` VALUES (41, '2018_08_07_140330_move_folders_into_file_entries_table', 1);
INSERT INTO `migrations` VALUES (42, '2018_08_07_140440_migrate_file_entry_users_to_many_to_many', 1);
INSERT INTO `migrations` VALUES (43, '2018_08_10_142251_update_users_table_to_v2', 1);
INSERT INTO `migrations` VALUES (44, '2018_08_15_132225_move_uploads_into_subfolders', 1);
INSERT INTO `migrations` VALUES (45, '2018_08_16_111525_transform_file_entries_records_to_v2', 1);
INSERT INTO `migrations` VALUES (46, '2018_08_31_104145_rename_uploadables_table', 1);
INSERT INTO `migrations` VALUES (47, '2018_08_31_104325_rename_file_entry_models_table_columns', 1);
INSERT INTO `migrations` VALUES (48, '2018_11_26_171703_add_type_and_title_columns_to_pages_table', 1);
INSERT INTO `migrations` VALUES (49, '2018_12_01_144233_change_unique_index_on_tags_table', 1);
INSERT INTO `migrations` VALUES (50, '2019_02_16_150049_delete_old_seo_settings', 1);
INSERT INTO `migrations` VALUES (51, '2019_02_24_141457_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (52, '2019_03_11_162627_add_preview_token_to_file_entries_table', 1);
INSERT INTO `migrations` VALUES (53, '2019_03_12_160803_add_thumbnail_column_to_file_entries_table', 1);
INSERT INTO `migrations` VALUES (54, '2019_03_16_161836_add_paypal_id_column_to_billing_plans_table', 1);
INSERT INTO `migrations` VALUES (55, '2019_05_14_120930_index_description_column_in_file_entries_table', 1);
INSERT INTO `migrations` VALUES (56, '2019_06_08_120504_create_custom_domains_table', 1);
INSERT INTO `migrations` VALUES (57, '2019_06_13_140318_add_user_id_column_to_pages_table', 1);
INSERT INTO `migrations` VALUES (58, '2019_06_15_114320_rename_pages_table_to_custom_pages', 1);
INSERT INTO `migrations` VALUES (59, '2019_06_18_133933_create_permissions_table', 1);
INSERT INTO `migrations` VALUES (60, '2019_06_18_134203_create_permissionables_table', 1);
INSERT INTO `migrations` VALUES (61, '2019_06_18_135822_rename_permissions_columns', 1);
INSERT INTO `migrations` VALUES (62, '2019_06_25_133852_move_inline_permissions_to_separate_table', 1);
INSERT INTO `migrations` VALUES (63, '2019_07_08_122001_create_css_themes_table', 1);
INSERT INTO `migrations` VALUES (64, '2019_07_20_141752_create_invoices_table', 1);
INSERT INTO `migrations` VALUES (65, '2019_08_19_121112_add_global_column_to_custom_domains_table', 1);
INSERT INTO `migrations` VALUES (66, '2019_09_13_141123_change_plan_amount_to_float', 1);
INSERT INTO `migrations` VALUES (67, '2019_10_14_171943_add_index_to_username_column', 1);
INSERT INTO `migrations` VALUES (68, '2019_10_20_143522_create_comments_table', 1);
INSERT INTO `migrations` VALUES (69, '2019_10_23_134520_create_notifications_table', 1);
INSERT INTO `migrations` VALUES (70, '2019_11_21_144956_add_resource_id_and_type_to_custom_domains_table', 1);
INSERT INTO `migrations` VALUES (71, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (72, '2019_12_14_194512_rename_public_path_column_to_disk_prefix', 1);
INSERT INTO `migrations` VALUES (73, '2019_12_24_165237_change_file_size_column_default_value_to_0', 1);
INSERT INTO `migrations` VALUES (74, '2019_12_28_190836_update_file_entry_models_table_to_v2', 1);
INSERT INTO `migrations` VALUES (75, '2019_12_28_191105_move_user_file_entry_table_records_to_file_entry_models', 1);
INSERT INTO `migrations` VALUES (76, '2020_01_26_143733_create_notification_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (77, '2020_03_03_140720_add_language_col_to_localizations_table', 1);
INSERT INTO `migrations` VALUES (78, '2020_03_03_143142_add_lang_code_to_existing_localizations', 1);
INSERT INTO `migrations` VALUES (79, '2020_04_14_163347_add_hidden_column_to_plans_table', 1);
INSERT INTO `migrations` VALUES (80, '2020_06_27_180040_add_verified_at_column_to_users_table', 1);
INSERT INTO `migrations` VALUES (81, '2020_06_27_180253_move_confirmed_column_to_email_verified_at', 1);
INSERT INTO `migrations` VALUES (82, '2020_07_15_144024_fix_issues_with_migration_to_laravel_7', 1);
INSERT INTO `migrations` VALUES (83, '2020_07_22_165126_create_workspaces_table', 1);
INSERT INTO `migrations` VALUES (84, '2020_07_23_145652_create_workspace_invites_table', 1);
INSERT INTO `migrations` VALUES (85, '2020_07_23_164502_create_workspace_user_table', 1);
INSERT INTO `migrations` VALUES (86, '2020_07_26_165349_add_columns_to_roles_table', 1);
INSERT INTO `migrations` VALUES (87, '2020_07_29_141418_add_workspace_id_column_to_workspaceable_models', 1);
INSERT INTO `migrations` VALUES (88, '2020_07_30_152330_add_type_column_to_permissions_table', 1);
INSERT INTO `migrations` VALUES (89, '2020_08_29_165057_add_hide_nav_column_to_custom_pages_table', 1);
INSERT INTO `migrations` VALUES (90, '2020_12_14_155112_create_table_fcm_tokens', 1);
INSERT INTO `migrations` VALUES (91, '2020_12_17_124109_subscribe_users_to_notifications', 1);
INSERT INTO `migrations` VALUES (92, '2021_04_22_172459_add_internal_columm_to_roles_table', 1);
INSERT INTO `migrations` VALUES (93, '2021_05_03_173446_add_deleted_column_to_comments_table', 1);
INSERT INTO `migrations` VALUES (94, '2021_05_12_164940_add_advanced_column_to_permissions_table', 1);
INSERT INTO `migrations` VALUES (95, '2021_06_04_143405_add_workspace_id_col_to_custom_domains_table', 1);
INSERT INTO `migrations` VALUES (96, '2021_06_04_143406_add_workspace_id_col_to_custom_pages_table', 1);
INSERT INTO `migrations` VALUES (97, '2021_06_05_182202_create_csv_exports_table', 1);
INSERT INTO `migrations` VALUES (98, '2021_06_18_161030_rename_gateway_col_in_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (99, '2021_06_19_111939_add_owner_id_column_to_file_entries_table', 1);
INSERT INTO `migrations` VALUES (100, '2021_06_19_112035_materialize_owner_id_in_file_entries_table', 1);
INSERT INTO `migrations` VALUES (101, '2021_07_06_144837_migrate_landing_page_config_to_20', 1);
INSERT INTO `migrations` VALUES (102, '2021_07_17_093454_add_created_at_col_to_user_role_table', 1);

-- ----------------------------
-- Table structure for notification_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `notification_subscriptions`;
CREATE TABLE `notification_subscriptions`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notif_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `channels` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notification_subscriptions_notif_id_index`(`notif_id`) USING BTREE,
  INDEX `notification_subscriptions_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification_subscriptions
-- ----------------------------
INSERT INTO `notification_subscriptions` VALUES ('29c49cce-4752-46f1-bd16-82a6d9a5214c', 'A01', 2, '[\"email\",\"browser\",\"mobile\"]');
INSERT INTO `notification_subscriptions` VALUES ('a834a33e-9250-4df1-a49e-bcd3dd570453', 'A01', 3, '{\"0\":\"email\",\"1\":\"browser\",\"2\":\"mobile\",\"email\":true,\"browser\":false,\"mobile\":true}');
INSERT INTO `notification_subscriptions` VALUES ('ad3583de-7fc8-436a-8a42-7776b9d998db', 'W01', 3, '{\"0\":\"email\",\"1\":\"browser\",\"2\":\"mobile\",\"email\":true,\"browser\":false,\"mobile\":true}');
INSERT INTO `notification_subscriptions` VALUES ('cf09c03e-af8c-40e9-91c2-fb3732d17832', 'W01', 4, '[\"email\",\"browser\",\"mobile\"]');
INSERT INTO `notification_subscriptions` VALUES ('fb26325c-0288-49a5-a1c7-05552a38f0f6', 'A01', 4, '[\"email\",\"browser\",\"mobile\"]');
INSERT INTO `notification_subscriptions` VALUES ('fc23b25c-45ec-42db-a953-210b4343f6b5', 'W01', 2, '[\"email\",\"browser\",\"mobile\"]');

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissionables
-- ----------------------------
DROP TABLE IF EXISTS `permissionables`;
CREATE TABLE `permissionables`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `permissionable_id` int(11) NOT NULL,
  `permissionable_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restrictions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissionable_unique`(`permission_id`, `permissionable_id`, `permissionable_type`) USING BTREE,
  INDEX `permissionables_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permissionables_permissionable_id_index`(`permissionable_id`) USING BTREE,
  INDEX `permissionables_permissionable_type_index`(`permissionable_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissionables
-- ----------------------------
INSERT INTO `permissionables` VALUES (1, 1, 1, 'App\\User', NULL);
INSERT INTO `permissionables` VALUES (2, 5, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (3, 10, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (4, 19, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (5, 23, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (6, 27, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (7, 33, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (8, 38, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (9, 43, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (10, 49, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (11, 50, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (12, 53, 1, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (13, 10, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (14, 23, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (15, 27, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (16, 33, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (17, 38, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (18, 49, 2, 'Common\\Auth\\Roles\\Role', '[]');
INSERT INTO `permissionables` VALUES (19, 18, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (20, 19, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (21, 20, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (22, 21, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (23, 22, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (24, 46, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (25, 47, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (26, 48, 3, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (27, 18, 4, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (28, 19, 4, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (29, 20, 4, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (30, 21, 4, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (31, 22, 4, 'Common\\Auth\\Roles\\Role', NULL);
INSERT INTO `permissionables` VALUES (32, 18, 5, 'Common\\Auth\\Roles\\Role', NULL);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restrictions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sitewide',
  `advanced` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `permissions_name_unique`(`name`) USING BTREE,
  INDEX `permissions_advanced_index`(`advanced`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'admin', 'Super Admin', 'Give all permissions to user.', 'admin', NULL, '2022-03-21 04:53:33', '2022-03-21 04:53:33', 'sitewide', 0);
INSERT INTO `permissions` VALUES (2, 'admin.access', 'Access Admin', 'Required in order to access any admin area page.', 'admin', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (3, 'appearance.update', 'Update Appearance', 'Allows access to appearance editor.', 'admin', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (4, 'reports.view', 'View Reports', 'Allows access to analytics page in admin area.', 'admin', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (5, 'api.access', 'Access Api', 'Required in order for users to be able to use the API.', 'api', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (6, 'roles.view', 'View Roles', 'Allow viewing ALL roles.', 'roles', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (7, 'roles.create', 'Create Roles', 'Allow creating new roles.', 'roles', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (8, 'roles.update', 'Update Roles', 'Allow updating ALL roles.', 'roles', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (9, 'roles.delete', 'Delete Roles', 'Allow deleting ALL roles.', 'roles', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (10, 'custom_pages.view', 'View Custom Pages', 'Allow viewing of all pages on the site, regardless of who created them. User can view their own pages without this permission.', 'custom_pages', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (11, 'custom_pages.create', 'Create Custom Pages', 'Allow creating new custom pages.', 'custom_pages', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of pages user will be able to create. Leave empty for unlimited.\"}]', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (12, 'custom_pages.update', 'Update Custom Pages', 'Allow editing of all pages on the site, regardless of who created them. User can edit their own pages without this permission.', 'custom_pages', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (13, 'custom_pages.delete', 'Delete Custom Pages', 'Allow deleting of all pages on the site, regardless of who created them. User can delete their own pages without this permission.', 'custom_pages', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (14, 'custom_domains.view', 'View Custom Domains', 'Allow viewing all domains on the site, regardless of who created them. User can view their own domains without this permission.', 'custom_domains', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (15, 'custom_domains.create', 'Create Custom Domains', 'Allow user to connect their own custom domains.', 'custom_domains', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of domains user will be able to create. Leave empty for unlimited.\"}]', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (16, 'custom_domains.update', 'Update Custom Domains', 'Allow editing all domains on the site, regardless of who created them. User can edit their own domains without this permission.', 'custom_domains', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (17, 'custom_domains.delete', 'Delete Custom Domains', 'Allow deleting all domains on the site, regardless of who created them. User can delete their own domains without this permission.', 'custom_domains', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (18, 'files.view', 'View Files', 'Allow viewing all uploaded files on the site. Users can view their own uploads without this permission.', 'files', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (19, 'files.create', 'Create Files', 'Allow uploading files on the site. This permission is used by any page where it is possible for user to upload files.', 'files', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (20, 'files.update', 'Update Files', 'Allow editing all uploaded files on the site. Users can edit their own uploads without this permission.', 'files', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (21, 'files.delete', 'Delete Files', 'Allow deleting all uploaded files on the site. Users can delete their own uploads (where applicable) without this permission.', 'files', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (22, 'files.download', 'Download Files', 'Allow downloading all uploaded files on the site. Users can download their own uploads (where applicable) without this permission.', 'files', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (23, 'users.view', 'View Users', 'Allow viewing user profile pages on the site. User can view their own profile without this permission.', 'users', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (24, 'users.create', 'Create Users', 'Allow creating users from admin area. Users can register for new accounts without this permission. Registration can be disabled from settings page.', 'users', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (25, 'users.update', 'Update Users', 'Allow editing details of any user on the site. User can edit their own details without this permission.', 'users', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (26, 'users.delete', 'Delete Users', 'Allow deleting any user on the site. User can request deletion of their own account without this permission.', 'users', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (27, 'localizations.view', 'View Localizations', 'Allow viewing ALL localizations.', 'localizations', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (28, 'localizations.create', 'Create Localizations', 'Allow creating new localizations.', 'localizations', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (29, 'localizations.update', 'Update Localizations', 'Allow updating ALL localizations.', 'localizations', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (30, 'localizations.delete', 'Delete Localizations', 'Allow deleting ALL localizations.', 'localizations', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (31, 'settings.view', 'View Settings', 'Allow viewing ALL settings.', 'settings', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (32, 'settings.update', 'Update Settings', 'Allow updating ALL settings.', 'settings', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (33, 'plans.view', 'View Plans', 'Allow viewing ALL plans.', 'plans', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (34, 'plans.create', 'Create Plans', 'Allow creating new plans.', 'plans', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (35, 'plans.update', 'Update Plans', 'Allow updating ALL plans.', 'plans', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (36, 'plans.delete', 'Delete Plans', 'Allow deleting ALL plans.', 'plans', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (37, 'invoices.view', 'View Invoices', 'Allow viewing ALL invoices.', 'invoices', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (38, 'tags.view', 'View Tags', 'Allow viewing ALL tags.', 'tags', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (39, 'tags.create', 'Create Tags', 'Allow creating new tags.', 'tags', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (40, 'tags.update', 'Update Tags', 'Allow updating ALL tags.', 'tags', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (41, 'tags.delete', 'Delete Tags', 'Allow deleting ALL tags.', 'tags', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 1);
INSERT INTO `permissions` VALUES (42, 'workspaces.view', 'View Workspaces', 'Allow viewing ALL workspaces.', 'workspaces', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (43, 'workspaces.create', 'Create Workspaces', 'Allow creating new workspaces.', 'workspaces', '[{\"name\":\"count\",\"type\":\"number\",\"description\":\"Maximum number of workspaces user will be able to create. Leave empty for unlimited.\"},{\"name\":\"member_count\",\"type\":\"number\",\"description\":\"Maximum number of members workspace is allowed to have.\"}]', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (44, 'workspaces.update', 'Update Workspaces', 'Allow updating ALL workspaces.', 'workspaces', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (45, 'workspaces.delete', 'Delete Workspaces', 'Allow deleting ALL workspaces.', 'workspaces', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (46, 'workspace_members.invite', 'Invite Members', 'Allow user to invite new members into a workspace.', 'workspace_members', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'workspace', 0);
INSERT INTO `permissions` VALUES (47, 'workspace_members.update', 'Update Members', 'Allow user to change role of other members.', 'workspace_members', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'workspace', 0);
INSERT INTO `permissions` VALUES (48, 'workspace_members.delete', 'Delete Members', 'Allow user to remove members from workspace.', 'workspace_members', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'workspace', 0);
INSERT INTO `permissions` VALUES (49, 'links.view', 'View Links', 'Allow viewing ALL links.', 'links', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (50, 'links.create', 'Create Links', 'Allow creating new links.', 'links', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (51, 'links.update', 'Update Links', 'Allow updating ALL links.', 'links', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (52, 'links.delete', 'Delete Links', 'Allow deleting ALL links.', 'links', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);
INSERT INTO `permissions` VALUES (53, 'notifications.subscribe', 'Subscribe Notifications', 'Allows agents to subscribe to various conversation notifications.', 'notifications', NULL, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'sitewide', 0);

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legacy_permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `guests` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sitewide',
  `internal` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `groups_name_unique`(`name`) USING BTREE,
  INDEX `groups_default_index`(`default`) USING BTREE,
  INDEX `groups_guests_index`(`guests`) USING BTREE,
  INDEX `roles_internal_index`(`internal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'users', NULL, 1, 0, '2022-03-21 04:53:34', '2022-03-21 04:53:34', NULL, 'sitewide', 0);
INSERT INTO `roles` VALUES (2, 'guests', NULL, 0, 1, '2022-03-21 04:53:34', '2022-03-21 04:53:34', NULL, 'sitewide', 0);
INSERT INTO `roles` VALUES (3, 'Workspace Admin', NULL, 0, 0, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'Manage workspace content, members, settings and invite new members.', 'workspace', 0);
INSERT INTO `roles` VALUES (4, 'Workspace Editor', NULL, 0, 0, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'Add, edit, move and delete workspace files.', 'workspace', 0);
INSERT INTO `roles` VALUES (5, 'Workspace Contributor', NULL, 0, 0, '2022-03-21 04:53:34', '2022-03-21 04:53:34', 'Add and edit files.', 'workspace', 0);

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_name_unique`(`name`) USING BTREE,
  INDEX `settings_private_index`(`private`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'dates.format', 'yyyy-MM-dd', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (2, 'dates.locale', 'en_US', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (3, 'social.google.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (4, 'social.twitter.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (5, 'social.facebook.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (6, 'realtime.enable', 'false', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (7, 'registration.disable', 'false', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (8, 'branding.favicon', 'client/favicon/icon-144x144.png', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (9, 'branding.logo_dark', 'client/assets/images/logo-dark.png', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (10, 'branding.logo_light', 'client/assets/images/logo-light.png', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (11, 'i18n.default_localization', 'en', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (12, 'i18n.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (13, 'logging.sentry_public', '', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (14, 'realtime.pusher_key', '', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (15, 'homepage.type', 'default', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (16, 'themes.default_mode', 'dark', '2022-03-21 04:53:34', '2022-03-21 04:55:06', 0);
INSERT INTO `settings` VALUES (17, 'themes.user_change', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (18, 'billing.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 06:38:03', 0);
INSERT INTO `settings` VALUES (19, 'billing.paypal_test_mode', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (20, 'billing.stripe_test_mode', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (21, 'billing.stripe.enable', 'false', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (22, 'billing.paypal.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 06:38:03', 0);
INSERT INTO `settings` VALUES (23, 'billing.accepted_cards', '[\"visa\",\"mastercard\",\"american-express\",\"discover\"]', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (24, 'custom_domains.default_host', '', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (25, 'uploads.chunk', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (26, 'cookie_notice.enable', 'true', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (27, 'cookie_notice.position', 'bottom', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (28, 'branding.site_name', 'BeDrive', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (29, 'cache.report_minutes', '60', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (30, 'site.force_https', '0', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (31, 'menus', '[{\"name\":\"Drive Sidebar\",\"position\":\"drive-sidebar\",\"items\":[{\"type\":\"route\",\"order\":1,\"label\":\"Shared with me\",\"action\":\"drive\\/shares\",\"icon\":\"people\"},{\"type\":\"route\",\"order\":2,\"label\":\"Recent\",\"action\":\"drive\\/recent\",\"icon\":\"access-time\"},{\"type\":\"route\",\"order\":3,\"label\":\"Starred\",\"action\":\"drive\\/starred\",\"icon\":\"star\"},{\"type\":\"route\",\"order\":4,\"label\":\"Trash\",\"action\":\"drive\\/trash\",\"icon\":\"delete\"}]},{\"name\":\"Drive Navbar\",\"position\":\"drive-navbar\",\"items\":[{\"type\":\"route\",\"order\":1,\"label\":\"Workspaces\",\"action\":\"drive\\/workspaces\"}]},{\"name\":\"footer\",\"position\":\"footer\",\"items\":[{\"type\":\"route\",\"position\":1,\"label\":\"Developers\",\"action\":\"\\/api-docs\",\"condition\":\"auth\"},{\"type\":\"route\",\"position\":2,\"label\":\"Privacy Policy\",\"action\":\"\\/pages\\/1\\/privacy-policy\"},{\"type\":\"route\",\"position\":3,\"label\":\"Terms of Service\",\"action\":\"\\/pages\\/2\\/terms-of-service\"},{\"type\":\"route\",\"position\":4,\"label\":\"Contact Us\",\"action\":\"\\/contact\"}]},{\"name\":\"Footer Social\",\"position\":\"footer-secondary\",\"items\":[{\"type\":\"link\",\"position\":1,\"icon\":\"facebook-square\",\"action\":\"https:\\/\\/facebook.com\"},{\"type\":\"link\",\"position\":2,\"icon\":\"twitter\",\"action\":\"https:\\/\\/twitter.com\"},{\"type\":\"link\",\"position\":3,\"icon\":\"instagram\",\"action\":\"https:\\/\\/instagram.com\"},{\"type\":\"link\",\"position\":4,\"icon\":\"youtube\",\"action\":\"https:\\/\\/youtube.com\"}]}]', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (32, 'uploads.max_size', '52428800', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (33, 'uploads.chunk_size', '15728640', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (34, 'uploads.available_space', '104857600', '2022-03-21 04:53:34', '2022-03-21 06:38:18', 0);
INSERT INTO `settings` VALUES (35, 'uploads.blocked_extensions', '[\"exe\",\"application/x-msdownload\",\"x-dosexec\"]', '2022-03-21 04:53:34', '2022-03-21 06:29:48', 0);
INSERT INTO `settings` VALUES (36, 'homepage.appearance', '{\"headerTitle\":\"BeDrive. A new home for your files.\",\"headerSubtitle\":\"Register or Login now to upload, backup, manage and access your files on any device, from anywhere, free.\",\"headerImage\":\"client\\/assets\\/images\\/homepage\\/homepage-header-bg.jpg\",\"headerImageOpacity\":1,\"headerOverlayColor1\":null,\"headerOverlayColor2\":null,\"footerTitle\":\"Get started with BeDrive\",\"footerSubtitle\":null,\"footerImage\":\"client\\/assets\\/images\\/homepage\\/homepage-footer-bg.svg\",\"actions\":{\"cta1\":\"Register Now\",\"cta2\":null,\"cta3\":\"Sign up for free\"},\"primaryFeatures\":[{\"title\":\"Store any file\",\"subtitle\":\"Keep photos, stories, designs, drawings, recordings, videos, and more. Your first 15 GB of storage are free.\",\"image\":\"upload.svg\"},{\"title\":\"See your stuff anywhere\",\"subtitle\":\"Your files in BeDrive can be reached from any smartphone, tablet, or computer.\",\"image\":\"web-devices.svg\"},{\"title\":\"Share files and folders\",\"subtitle\":\"You can quickly invite others to view, download, and collaborate on all the files you want.\",\"image\":\"share.svg\"}],\"secondaryFeatures\":[{\"title\":\"Keep your files safe\",\"image\":\"client\\/assets\\/images\\/homepage\\/homepage-feature-1.jpg\",\"description\":\"If something happens to your device, you don\'t have to worry about losing your files or photos \\u2013 they\'re in your BeDrive. And BeDrive is encrypted using SSL.\"},{\"title\":\"Reliable storage and fast transfers\",\"image\":\"client\\/assets\\/images\\/homepage\\/homepage-feature-2.jpg\",\"description\":\"We make secure cloud storage simple and convenient. Create a free BeDrive account today!\"}]}', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (37, 'drive.default_view', 'grid', '2022-03-21 04:53:34', '2022-03-21 04:53:34', 0);
INSERT INTO `settings` VALUES (38, 'drive.send_share_notification', 'true', '2022-03-21 04:53:34', '2022-03-21 06:28:40', 0);
INSERT INTO `settings` VALUES (39, 'share.suggest_emails', 'true', '2022-03-21 04:53:34', '2022-03-21 06:28:40', 0);
INSERT INTO `settings` VALUES (40, 'uploads.resume', 'true', '2022-03-21 06:29:48', '2022-03-21 06:29:48', 0);
INSERT INTO `settings` VALUES (41, 'uploads.allowed_extensions', '[]', '2022-03-21 06:29:48', '2022-03-21 06:29:48', 0);
INSERT INTO `settings` VALUES (42, 'billing.invoice.address', 'Phnom Penh', '2022-03-21 06:38:03', '2022-03-21 06:38:03', 0);
INSERT INTO `settings` VALUES (43, 'billing.invoice.notes', 'Thanks For Using BeDrive', '2022-03-21 06:38:03', '2022-03-21 06:38:03', 0);
INSERT INTO `settings` VALUES (44, 'ads.disable', 'true', '2022-03-21 09:21:00', '2022-03-21 09:21:00', 0);
INSERT INTO `settings` VALUES (45, 'ads.file-preview', '', '2022-03-21 09:21:00', '2022-03-21 09:21:00', 0);
INSERT INTO `settings` VALUES (46, 'ads.drive', '', '2022-03-21 09:21:00', '2022-03-21 09:21:00', 0);
INSERT INTO `settings` VALUES (47, 'ads.landing.top', '', '2022-03-21 09:21:00', '2022-03-21 09:21:00', 0);
INSERT INTO `settings` VALUES (48, 'mail.contact_page_address', 'ngettim14@gmail.com', '2022-03-21 09:40:54', '2022-03-21 09:40:54', 0);

-- ----------------------------
-- Table structure for shareable_links
-- ----------------------------
DROP TABLE IF EXISTS `shareable_links`;
CREATE TABLE `shareable_links`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hash` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `allow_edit` tinyint(1) NOT NULL DEFAULT 0,
  `allow_download` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `expires_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shareable_links_hash_unique`(`hash`) USING BTREE,
  INDEX `shareable_links_user_id_index`(`user_id`) USING BTREE,
  INDEX `shareable_links_entry_id_index`(`entry_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shareable_links
-- ----------------------------
INSERT INTO `shareable_links` VALUES (1, 'M2ZnyPhK0p7YjZ2dMShF3eFGOfSppO', 1, 2, 1, 1, '$2y$10$UDnW7TW8uZSfAtU78F6E4OYlcICw6Md.NpouWiRWOMZNAY7HZIxfK', NULL, '2022-03-21 06:57:42', '2022-03-21 06:57:42');

-- ----------------------------
-- Table structure for social_profiles
-- ----------------------------
DROP TABLE IF EXISTS `social_profiles`;
CREATE TABLE `social_profiles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `service_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_service_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `social_profiles_user_id_service_name_unique`(`user_id`, `service_name`) USING BTREE,
  UNIQUE INDEX `social_profiles_service_name_user_service_id_unique`(`service_name`, `user_service_id`) USING BTREE,
  INDEX `social_profiles_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of social_profiles
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gateway_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `gateway_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `trial_ends_at` timestamp(0) NULL DEFAULT NULL,
  `ends_at` timestamp(0) NULL DEFAULT NULL,
  `renews_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subscriptions_user_id_index`(`user_id`) USING BTREE,
  INDEX `subscriptions_plan_id_index`(`plan_id`) USING BTREE,
  INDEX `subscriptions_gateway_index`(`gateway_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------
INSERT INTO `subscriptions` VALUES (1, 3, '1', 'none', 'none', 1, 'One Dollar For 2 GM Storage', NULL, '2022-04-20 17:00:00', NULL, '2022-03-21 07:24:13', '2022-03-21 07:26:48');

-- ----------------------------
-- Table structure for taggables
-- ----------------------------
DROP TABLE IF EXISTS `taggables`;
CREATE TABLE `taggables`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `taggables_tag_id_taggable_id_user_id_taggable_type_unique`(`tag_id`, `taggable_id`, `user_id`, `taggable_type`) USING BTREE,
  INDEX `taggables_tag_id_index`(`tag_id`) USING BTREE,
  INDEX `taggables_taggable_id_index`(`taggable_id`) USING BTREE,
  INDEX `taggables_taggable_type_index`(`taggable_type`) USING BTREE,
  INDEX `taggables_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of taggables
-- ----------------------------
INSERT INTO `taggables` VALUES (1, 1, 8, 'Common\\Files\\FileEntry', 1);

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tags_name_type_unique`(`name`, `type`) USING BTREE,
  INDEX `tags_type_index`(`type`) USING BTREE,
  INDEX `tags_created_at_index`(`created_at`) USING BTREE,
  INDEX `tags_updated_at_index`(`updated_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (1, 'starred', 'Starred', 'label', '2022-03-21 04:53:34', '2022-03-21 04:53:34');

-- ----------------------------
-- Table structure for uploads
-- ----------------------------
DROP TABLE IF EXISTS `uploads`;
CREATE TABLE `uploads`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `thumbnail_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `path` varchar(191) CHARACTER SET latin1 COLLATE latin1_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uploads_file_name_unique`(`file_name`) USING BTREE,
  INDEX `uploads_name_index`(`name`) USING BTREE,
  INDEX `uploads_user_id_index`(`user_id`) USING BTREE,
  INDEX `uploads_public_index`(`public`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uploads
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_group_user_id_group_id_unique`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1, '2022-03-21 04:53:34');
INSERT INTO `user_role` VALUES (2, 3, 2, NULL);
INSERT INTO `user_role` VALUES (3, 3, 1, '2022-03-21 07:13:40');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `space_available` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `language` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `timezone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `available_space` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `legacy_permissions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `card_last_four` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_username_index`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'ngettim', 'ngettim14@gmail.com', '$2y$10$SiDHtBBmloddb27lhefsHO99o2TcVmDBk5xlvFTS9cSFcAw2JXPle', '0UxJED9fbHW28nP03AFtfJ7NNTavKLBuSkurA51XenSC15nVkwjgftimiufb', '2022-03-21 04:53:33', '2022-03-21 04:53:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-03-21 04:53:33');
INSERT INTO `users` VALUES (3, '', 'ngettim96@gmail.com', '$2y$10$hkqTcmWQqKuRSbjjmcPwD.nCl3/Q1w588ya90bY447I0McUJMTayy', 'fIrPwdKIVK2cORmM18fLB4agPZZumbW1Xju1aICBRSCcEIaWBtb4TVYjON3M', '2022-03-21 07:02:36', '2022-03-21 09:37:29', NULL, 'en', NULL, NULL, 'storage/avatars/waOTWGM6Ah7btKSQHPidtlAWBiSJ4QyZieTwYuvd.png', NULL, NULL, 'Mr', 'Tim', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, '', 'admin@gmail.com', '$2y$10$eMs3C/GJHuUTvgFwufhFRuhJUcyAdITuyQ4wLyY013EA1itggfyTi', NULL, '2022-03-21 13:00:33', '2022-03-21 13:00:33', NULL, 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_oauth
-- ----------------------------
DROP TABLE IF EXISTS `users_oauth`;
CREATE TABLE `users_oauth`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `service` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_oauth_user_id_service_unique`(`user_id`, `service`) USING BTREE,
  UNIQUE INDEX `users_oauth_token_unique`(`token`) USING BTREE,
  INDEX `users_oauth_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for workspace_invites
-- ----------------------------
DROP TABLE IF EXISTS `workspace_invites`;
CREATE TABLE `workspace_invites`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `workspace_invites_workspace_id_index`(`workspace_id`) USING BTREE,
  INDEX `workspace_invites_user_id_index`(`user_id`) USING BTREE,
  INDEX `workspace_invites_email_index`(`email`) USING BTREE,
  INDEX `workspace_invites_role_id_index`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workspace_invites
-- ----------------------------

-- ----------------------------
-- Table structure for workspace_user
-- ----------------------------
DROP TABLE IF EXISTS `workspace_user`;
CREATE TABLE `workspace_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `is_owner` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `workspace_user_workspace_id_user_id_unique`(`workspace_id`, `user_id`) USING BTREE,
  INDEX `workspace_user_user_id_index`(`user_id`) USING BTREE,
  INDEX `workspace_user_workspace_id_index`(`workspace_id`) USING BTREE,
  INDEX `workspace_user_role_id_index`(`role_id`) USING BTREE,
  INDEX `workspace_user_is_owner_index`(`is_owner`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workspace_user
-- ----------------------------
INSERT INTO `workspace_user` VALUES (1, 1, 1, NULL, 1, '2022-03-21 05:59:09', '2022-03-21 05:59:09');

-- ----------------------------
-- Table structure for workspaces
-- ----------------------------
DROP TABLE IF EXISTS `workspaces`;
CREATE TABLE `workspaces`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `workspaces_owner_id_index`(`owner_id`) USING BTREE,
  INDEX `workspaces_created_at_index`(`created_at`) USING BTREE,
  INDEX `workspaces_updated_at_index`(`updated_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workspaces
-- ----------------------------
INSERT INTO `workspaces` VALUES (1, 'Tim Workspace', 1, '2022-03-21 05:59:09', '2022-03-21 05:59:09');

SET FOREIGN_KEY_CHECKS = 1;
