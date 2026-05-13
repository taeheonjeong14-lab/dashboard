-- Target schemas for PDF-app data migrated off the attach DB (public.*).
-- Table → schema mapping: scripts/sql/followup-chart-pdf-health-report-hospital-fk-plan.sql

create schema if not exists chart_pdf;
create schema if not exists health_report;

grant usage on schema chart_pdf to service_role, authenticated;
grant usage on schema health_report to service_role, authenticated;
