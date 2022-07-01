-- global_data.cd_variables definition

CREATE TABLE `cd_variables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Meaningless auto assigned integer for relating to other data. ',
  `name` varchar(125) NOT NULL COMMENT '[Admin-Setting] A consumer friendly name for this item. The intent is to provide a test name that health care consumers will recognize.',
  `abbreviated_name` varchar(100) DEFAULT NULL COMMENT '[Admin-Setting] Canonical shorter version of the name or scientific abbreviation',
  `additional_meta_data` text COMMENT '[] JSON-encoded additional data that does not fit in any other columns. JSON object',
  `analysis_ended_at` timestamp NULL DEFAULT NULL COMMENT '[Internal] When last analysis was completed.',
  `analysis_requested_at` timestamp NULL DEFAULT NULL COMMENT '[Internal] When an analysis was manually triggered.',
  `analysis_settings_modified_at` timestamp NULL DEFAULT NULL COMMENT '[Internal] When last analysis settings we''re changed.',
  `analysis_started_at` timestamp NULL DEFAULT NULL COMMENT '[Internal] When the analysis started.',
  `average_seconds_between_measurements` int(11) DEFAULT NULL COMMENT '[Calculated] Average seconds between measurements for the average user.  Helps identify duplicate or erronous data and spamming of the database.',
  `best_aggregate_correlation_id` int(11) DEFAULT NULL COMMENT '[Calculated] The strongest predictor or outcome for all users.',
  `best_cause_variable_id` int(10) unsigned DEFAULT NULL COMMENT '[Calculated] The strongest predictor variable for all users.',
  `best_effect_variable_id` int(10) unsigned DEFAULT NULL COMMENT '[Calculated] The strongest outcome variable for all users.',
  `boring` tinyint(1) DEFAULT NULL COMMENT '[Admin-Setting] The variable is boring if the average person would not be interested in its causes or effects.',
  `brand_name` varchar(125) DEFAULT NULL COMMENT '[Admin-Setting,Imported] Product brand name',
  `canonical_variable_id` int(10) unsigned DEFAULT NULL COMMENT '[Admin-Setting] If a variable duplicates another but with a different name, set the canonical variable id to match the variable with the more appropriate name.  Then only the canonical variable will be displayed and all data for the duplicate variable will be included when fetching data for the canonical variable.',
  `cause_only` tinyint(1) DEFAULT NULL COMMENT '[Admin-Setting] A value of 1 indicates that this variable is generally a cause in a causal relationship.  An example of a causeOnly variable would be a variable such as Cloud Cover which would generally not be influenced by the behaviour of the user',
  `charts` json DEFAULT NULL COMMENT '[Calculated] Highcharts configuration',
  `client_id` varchar(80) DEFAULT NULL COMMENT '[Calculated] ID',
  `combination_operation` enum('SUM','MEAN') DEFAULT NULL COMMENT '[Admin-Setting] How to combine values of this variable (for instance, to see a summary of the values over a month) SUM or MEAN',
  `common_alias` varchar(125) DEFAULT NULL COMMENT '[Deprecated]',
  `common_maximum_allowed_daily_value` double DEFAULT NULL COMMENT '[validation]',
  `common_minimum_allowed_daily_value` double DEFAULT NULL COMMENT '[validation]',
  `common_minimum_allowed_non_zero_value` double DEFAULT NULL COMMENT '[validation]',
  `controllable` tinyint(1) DEFAULT NULL COMMENT 'You can control the foods you eat directly. However, symptom severity or weather is not directly controllable. ',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '[db-gen]',
  `creator_user_id` bigint(20) unsigned NOT NULL COMMENT '[api-gen]',
  `data_sources_count` text COMMENT 'Array of connector or client measurement data source names as key with number of users as value',
  `default_unit_id` smallint(5) unsigned NOT NULL COMMENT 'ID of the default unit for the variable',
  `default_value` double DEFAULT NULL COMMENT '[]',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `deletion_reason` varchar(280) DEFAULT NULL COMMENT 'The reason the variable was deleted.',
  `description` text COMMENT '[]',
  `duration_of_action` int(10) unsigned DEFAULT NULL COMMENT 'How long the effect of a measurement in this variable lasts',
  `earliest_non_tagged_measurement_start_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `earliest_tagged_measurement_start_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `filling_type` enum('zero','none','interpolation','value') DEFAULT NULL COMMENT '[]',
  `filling_value` double DEFAULT '-1' COMMENT 'Value for replacing null measurements',
  `image_url` varchar(2083) DEFAULT NULL COMMENT '[]',
  `informational_url` varchar(2083) DEFAULT NULL COMMENT '[Admin-Setting] A wikipedia article, for instance',
  `internal_error_message` text COMMENT '[]',
  `ion_icon` varchar(40) DEFAULT NULL COMMENT '[Admin-Setting]',
  `is_goal` tinyint(1) DEFAULT NULL COMMENT 'The effect of a food on the severity of a symptom is useful because you can control the predictor directly. However, the effect of a symptom on the foods you eat is not very useful.  The foods you eat are not generally an objective end in themselves. ',
  `is_public` tinyint(1) DEFAULT NULL COMMENT '[]',
  `kurtosis` double DEFAULT NULL COMMENT 'Kurtosis',
  `latest_non_tagged_measurement_start_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `latest_tagged_measurement_start_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `loinc_core_id` int(11) DEFAULT NULL COMMENT '[]',
  `manual_tracking` tinyint(1) DEFAULT NULL COMMENT '[]',
  `maximum_allowed_daily_value` double DEFAULT NULL COMMENT 'The maximum allowed value in the default unit for measurements aggregated over a single day. ',
  `maximum_allowed_value` double DEFAULT NULL COMMENT 'Maximum reasonable value for a single measurement for this variable in the default unit. ',
  `maximum_recorded_value` double DEFAULT NULL COMMENT 'Maximum recorded value of this variable',
  `mean` double DEFAULT NULL COMMENT 'Mean',
  `median_seconds_between_measurements` int(11) DEFAULT NULL COMMENT '[]',
  `median` double DEFAULT NULL COMMENT 'Median',
  `minimum_allowed_seconds_between_measurements` int(11) DEFAULT NULL COMMENT '[]',
  `minimum_allowed_value` double DEFAULT NULL COMMENT 'Minimum reasonable value for this variable (uses default unit)',
  `minimum_recorded_value` double DEFAULT NULL COMMENT 'Minimum recorded value of this variable',
  `most_common_connector_id` int(10) unsigned DEFAULT NULL COMMENT '[]',
  `most_common_original_unit_id` int(11) DEFAULT NULL COMMENT 'Most common Unit ID',
  `most_common_source_name` varchar(255) DEFAULT NULL COMMENT '[]',
  `most_common_value` double DEFAULT NULL COMMENT 'Most common value',
  `newest_data_at` timestamp NULL DEFAULT NULL COMMENT '[]',
  `number_common_tagged_by` int(10) unsigned DEFAULT NULL COMMENT '[]',
  `number_of_aggregate_correlations_as_cause` int(10) unsigned DEFAULT NULL COMMENT 'Number of aggregate correlations for which this variable is the cause variable',
  `number_of_aggregate_correlations_as_effect` int(10) unsigned DEFAULT NULL COMMENT 'Number of aggregate correlations for which this variable is the effect variable',
  `number_of_applications_where_outcome_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Applications for this Outcome Variable.\r\n                [Formula: \r\n                    update variables\r\n                        left join (\r\n                            select count(id) as total, outcome_variable_id\r\n                            from applications\r\n                            group by outcome_variable_id\r\n                        )\r\n                        as grouped on variables.id = grouped.outcome_variable_id\r\n                    set variables.number_of_applications_where_outcome_variable = count(grouped.total)\r\n                ]',
  `number_of_applications_where_predictor_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Applications for this Predictor Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, predictor_variable_id\n                            from applications\n                            group by predictor_variable_id\n                        )\n                        as grouped on variables.id = grouped.predictor_variable_id\n                    set variables.number_of_applications_where_predictor_variable = count(grouped.total)\n                ]\n                ',
  `number_of_common_children` int(11) DEFAULT NULL COMMENT 'Measurements for this parent category variable can be synthetically generated by measurements from its child variables. ',
  `number_of_common_foods` int(11) DEFAULT NULL COMMENT 'Measurements for this ingredient variable can be synthetically generate by food measurements. ',
  `number_of_common_ingredients` int(11) DEFAULT NULL COMMENT 'Measurements for this variable can be used to synthetically generate ingredient measurements. ',
  `number_of_common_joined_variables` int(11) DEFAULT NULL COMMENT 'Joined variables are duplicate variables measuring the same thing. ',
  `number_of_common_parents` int(11) DEFAULT NULL COMMENT 'Measurements for this parent category variable can be synthetically generated by measurements from its child variables. ',
  `number_of_common_tags_where_tag_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Common Tags for this Tag Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, tag_variable_id\n                            from common_tags\n                            group by tag_variable_id\n                        )\n                        as grouped on variables.id = grouped.tag_variable_id\n                    set variables.number_of_common_tags_where_tag_variable = count(grouped.total)\n                ]\n                ',
  `number_of_common_tags_where_tagged_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Common Tags for this Tagged Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, tagged_variable_id\n                            from common_tags\n                            group by tagged_variable_id\n                        )\n                        as grouped on variables.id = grouped.tagged_variable_id\n                    set variables.number_of_common_tags_where_tagged_variable = count(grouped.total)\n                ]\n                ',
  `number_of_common_tags` int(10) unsigned DEFAULT NULL COMMENT '[]',
  `number_of_measurements` int(10) unsigned DEFAULT NULL COMMENT 'Number of Measurements for this Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, variable_id\n                            from measurements\n                            group by variable_id\n                        )\n                        as grouped on variables.id = grouped.variable_id\n                    set variables.number_of_measurements = count(grouped.total)]',
  `number_of_outcome_case_studies` int(10) unsigned DEFAULT NULL COMMENT 'Number of Individual Case Studies for this Cause Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, cause_variable_id\n                            from correlations\n                            group by cause_variable_id\n                        )\n                        as grouped on variables.id = grouped.cause_variable_id\n                    set variables.number_of_outcome_case_studies = count(grouped.total)\n                ]\n                ',
  `number_of_outcome_population_studies` int(10) unsigned DEFAULT NULL COMMENT 'Number of Global Population Studies for this Cause Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, cause_variable_id\n                            from aggregate_correlations\n                            group by cause_variable_id\n                        )\n                        as grouped on variables.id = grouped.cause_variable_id\n                    set variables.number_of_outcome_population_studies = count(grouped.total)\n                ]\n                ',
  `number_of_predictor_case_studies` int(10) unsigned DEFAULT NULL COMMENT 'Number of Individual Case Studies for this Effect Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, effect_variable_id\n                            from correlations\n                            group by effect_variable_id\n                        )\n                        as grouped on variables.id = grouped.effect_variable_id\n                    set variables.number_of_predictor_case_studies = count(grouped.total)]',
  `number_of_predictor_population_studies` int(10) unsigned DEFAULT NULL COMMENT 'Number of Global Population Studies for this Effect Variable.\n                [Formula: \n                    update variables\n                        left join (\n                            select count(id) as total, effect_variable_id\n                            from aggregate_correlations\n                            group by effect_variable_id\n                        )\n                        as grouped on variables.id = grouped.effect_variable_id\n                    set variables.number_of_predictor_population_studies = count(grouped.total)\n                ]\n                ',
  `number_of_raw_measurements_with_tags_joins_children` int(10) unsigned DEFAULT NULL COMMENT '[]',
  `number_of_soft_deleted_measurements` int(11) DEFAULT NULL COMMENT 'Formula: update variables v \n                inner join (\n                    select measurements.variable_id, count(measurements.id) as number_of_soft_deleted_measurements \n                    from measurements\n                    where measurements.deleted_at is not null\n                    group by measurements.variable_id\n                    ) m on v.id = m.variable_id\n                set v.number_of_soft_deleted_measurements = m.number_of_soft_deleted_measurements\n            ',
  `number_of_studies_where_cause_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Studies for this Cause Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, cause_variable_id\n                            from studies\n                            group by cause_variable_id\n                        )\n                        as grouped on variables.id = grouped.cause_variable_id\n                    set variables.number_of_studies_where_cause_variable = count(grouped.total)]',
  `number_of_studies_where_effect_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Studies for this Effect Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, effect_variable_id\n                            from studies\n                            group by effect_variable_id\n                        )\n                        as grouped on variables.id = grouped.effect_variable_id\n                    set variables.number_of_studies_where_effect_variable = count(grouped.total)]',
  `number_of_tracking_reminder_notifications` int(10) unsigned DEFAULT NULL COMMENT 'Number of Tracking Reminder Notifications for this Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, variable_id\n                            from tracking_reminder_notifications\n                            group by variable_id\n                        )\n                        as grouped on variables.id = grouped.variable_id\n                    set variables.number_of_tracking_reminder_notifications = count(grouped.total)]',
  `number_of_tracking_reminders` int(11) DEFAULT NULL COMMENT '[]',
  `number_of_unique_values` int(11) DEFAULT NULL COMMENT 'Number of unique values',
  `number_of_user_children` int(11) DEFAULT NULL COMMENT 'Measurements for this parent category variable can be synthetically generated by measurements from its child variables. This only includes ones created by users. ',
  `number_of_user_foods` int(11) DEFAULT NULL COMMENT 'Measurements for this ingredient variable can be synthetically generate by food measurements. This only includes ones created by users. ',
  `number_of_user_ingredients` int(11) DEFAULT NULL COMMENT 'Measurements for this variable can be used to synthetically generate ingredient measurements. This only includes ones created by users. ',
  `number_of_user_joined_variables` int(11) DEFAULT NULL COMMENT 'Joined variables are duplicate variables measuring the same thing. This only includes ones created by users. ',
  `number_of_user_parents` int(11) DEFAULT NULL COMMENT 'Measurements for this parent category variable can be synthetically generated by measurements from its child variables. This only includes ones created by users. ',
  `number_of_user_tags_where_tag_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of User Tags for this Tag Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, tag_variable_id\n                            from user_tags\n                            group by tag_variable_id\n                        )\n                        as grouped on variables.id = grouped.tag_variable_id\n                    set variables.number_of_user_tags_where_tag_variable = count(grouped.total)]',
  `number_of_user_tags_where_tagged_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of User Tags for this Tagged Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, tagged_variable_id\n                            from user_tags\n                            group by tagged_variable_id\n                        )\n                        as grouped on variables.id = grouped.tagged_variable_id\n                    set variables.number_of_user_tags_where_tagged_variable = count(grouped.total)]',
  `number_of_user_variables` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of variables',
  `number_of_users_where_primary_outcome_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Users for this Primary Outcome Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(ID) as total, primary_outcome_variable_id\n                            from wp_users\n                            group by primary_outcome_variable_id\n                        )\n                        as grouped on variables.id = grouped.primary_outcome_variable_id\n                    set variables.number_of_users_where_primary_outcome_variable = count(grouped.total)]',
  `number_of_variables_where_best_cause_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Variables for this Best Cause Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, best_cause_variable_id\n                            from variables\n                            group by best_cause_variable_id\n                        )\n                        as grouped on variables.id = grouped.best_cause_variable_id\n                    set variables.number_of_variables_where_best_cause_variable = count(grouped.total)]',
  `number_of_variables_where_best_effect_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Variables for this Best Effect Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, best_effect_variable_id\n                            from variables\n                            group by best_effect_variable_id\n                        )\n                        as grouped on variables.id = grouped.best_effect_variable_id\n                    set variables.number_of_variables_where_best_effect_variable = count(grouped.total)]',
  `number_of_votes_where_cause_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Votes for this Cause Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, cause_variable_id\n                            from votes\n                            group by cause_variable_id\n                        )\n                        as grouped on variables.id = grouped.cause_variable_id\n                    set variables.number_of_votes_where_cause_variable = count(grouped.total)]',
  `number_of_votes_where_effect_variable` int(10) unsigned DEFAULT NULL COMMENT 'Number of Votes for this Effect Variable.\n                    [Formula: update variables\n                        left join (\n                            select count(id) as total, effect_variable_id\n                            from votes\n                            group by effect_variable_id\n                        )\n                        as grouped on variables.id = grouped.effect_variable_id\n                    set variables.number_of_votes_where_effect_variable = count(grouped.total)]',
  `onset_delay` int(10) unsigned DEFAULT NULL COMMENT 'How long it takes for a measurement in this variable to take effect',
  `optimal_value_message` varchar(500) DEFAULT NULL COMMENT '[]',
  `outcome` tinyint(1) DEFAULT NULL COMMENT 'Outcome variables (those with `outcome` == 1) are variables for which a human would generally want to identify the influencing factors.  These include symptoms of illness, physique, mood, cognitive performance, etc.  Generally correlation calculations are only performed on outcome variables.',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'ID of the parent variable if this variable has any parent',
  `predictor` tinyint(1) DEFAULT NULL COMMENT 'predictor is true if the variable is a factor that could influence an outcome of interest',
  `price` double DEFAULT NULL COMMENT 'Price',
  `product_url` varchar(2083) DEFAULT NULL COMMENT 'Product URL',
  `reason_for_analysis` varchar(255) DEFAULT NULL COMMENT '[]',
  `record_size_in_kb` int(11) DEFAULT NULL COMMENT '[]',
  `ref_aact_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_fdc_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_gene_ontology_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_hmdb_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_icd10_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_loinc_id` varchar(10) unsigned DEFAULT NULL COMMENT '[Reference] The international standard for identifying health measurements, observations, and documents. The unique LOINC Code is a string in the format of nnnnnnnn-n.',
  `ref_meddra_all_indications_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_meddra_all_side_effects_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_rxnorm_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_snomed_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `ref_uniprot_id` int(10) unsigned DEFAULT NULL COMMENT '[Reference]',
  `second_most_common_value` double DEFAULT NULL COMMENT '[]',
  `skewness` double DEFAULT NULL COMMENT '[] Skewness',
  `slug` varchar(200) DEFAULT NULL COMMENT 'The slug is an identifier in human-readable keywords, used as id for the exchange format and id in document database.',
  `sort_order` int(11) NOT NULL COMMENT '[]',
  `source_url` varchar(2083) DEFAULT NULL COMMENT '[admin,public-if-null] URL for the website related to the database containing the info that was used to create this variable such as https://world.openfoodfacts.org or https://dsld.od.nih.gov/dsld',
  `standard_deviation` double DEFAULT NULL COMMENT '[calculated] Standard Deviation',
  `status` varchar(25) NOT NULL DEFAULT 'WAITING' COMMENT 'status',
  `synonyms` varchar(600) DEFAULT NULL COMMENT '[admin-edit,public-write] The primary variable name and any synonyms for it. This field should be used for non-specific variable searches.',
  `third_most_common_value` double DEFAULT NULL COMMENT '[]',
  `upc_12` varchar(255) DEFAULT NULL COMMENT '[]',
  `upc_14` varchar(255) DEFAULT NULL COMMENT '[]',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '[]',
  `user_error_message` text COMMENT '[]',
  `valence` enum('positive','negative','neutral') DEFAULT NULL COMMENT '[]',
  `tags` varchar(600) DEFAULT NULL COMMENT '[Reference] Tags for categorization in multiple levels/ontologies/types/subtypes e.g. Condition, Intervention, Biomarker and going deeper the ontology level: Laboratory test, Blood test, Lipid panel, or for logical grouping e.g. Risk scores, Hormones, Medical use',
  `variance` double DEFAULT NULL COMMENT 'Variance',
  `version_first_released` varchar(255) DEFAULT NULL COMMENT 'The CureDAO version number in which the record was first released. For oldest records where the version released number is known, this field will be null.',
  `version_last_changed` varchar(255) DEFAULT NULL COMMENT 'The CureDAO version number in which the record has last changed. For records that have never been updated after their release, this field will contain the same value as the loinc.VersionFirstReleased field.',
  `wikipedia_title` varchar(100) DEFAULT NULL COMMENT '[]',
  `wikipedia_url` varchar(2083) DEFAULT NULL COMMENT '[]',
  `wp_post_id` bigint(20) unsigned DEFAULT NULL COMMENT '[]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`) USING BTREE,
  UNIQUE KEY `variables_slug_uindex` (`slug`),
  KEY `fk_variableDefaultUnit` (`default_unit_id`) USING BTREE,
  KEY `IDX_cat_unit_public_name` (`variable_category_id`,`default_unit_id`,`name`,`number_of_user_variables`,`id`) USING BTREE,
  KEY `variables_client_id_fk` (`client_id`),
  KEY `variables_best_cause_variable_id_fk` (`best_cause_variable_id`),
  KEY `variables_best_effect_variable_id_fk` (`best_effect_variable_id`),
  KEY `variables_wp_posts_ID_fk` (`wp_post_id`),
  KEY `variables_analysis_ended_at_index` (`analysis_ended_at`),
  KEY `variables_aggregate_correlations_id_fk` (`best_aggregate_correlation_id`),
  KEY `variables_public_name_number_of_user_variables_index` (`name`,`number_of_user_variables`),
  KEY `public_deleted_at_synonyms_number_of_user_variables_index` (`deleted_at`,`synonyms`,`number_of_user_variables`),
  KEY `qm_variables_loinc_core_id_fk` (`loinc_core_id`),
  CONSTRAINT `qm_variables_loinc_core_id_fk` FOREIGN KEY (`loinc_core_id`) REFERENCES `loinc_core` (`id`),
  CONSTRAINT `variables_aggregate_correlations_id_fk` FOREIGN KEY (`best_aggregate_correlation_id`) REFERENCES `cd_aggregate_analyses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `variables_best_cause_variable_id_fk` FOREIGN KEY (`best_cause_variable_id`) REFERENCES `cd_variables` (`id`) ON DELETE SET NULL,
  CONSTRAINT `variables_best_effect_variable_id_fk` FOREIGN KEY (`best_effect_variable_id`) REFERENCES `cd_variables` (`id`) ON DELETE SET NULL,
  CONSTRAINT `variables_client_id_fk` FOREIGN KEY (`client_id`) REFERENCES `oa_clients` (`client_id`),
  CONSTRAINT `variables_default_unit_id_fk` FOREIGN KEY (`default_unit_id`) REFERENCES `qm_units` (`id`),
  CONSTRAINT `variables_variable_category_id_fk` FOREIGN KEY (`variable_category_id`) REFERENCES `qm_variable_categories` (`id`),
  CONSTRAINT `variables_wp_posts_ID_fk` FOREIGN KEY (`wp_post_id`) REFERENCES `wp_posts` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6067536 DEFAULT CHARSET=utf8 COMMENT='Variable overviews with statistics, analysis settings, and data visualizations and likely outcomes or predictors based on the anonymously aggregated donated data.';
