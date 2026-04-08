Deploy the current branch to staging environment:

1. Pre-flight checks:
   - Verify we are NOT on main branch
   - Run tests: `pytest`
   - Run lint: `ruff check .`
   - If any step fails, STOP and report the error

2. Check for pending migrations:
   - Look for new files in `alembic/versions/`
   - If migrations exist, note them in the deploy summary

3. Deploy:
   - [CUSTOMIZE: Add your deployment command here]
   - Example: `./deploy.sh staging`
   - Example: `git push staging HEAD:main`
   - Example: `aws ecs update-service --cluster staging --service api --force-new-deployment`

4. Post-deploy verification:
   - [CUSTOMIZE: Add your health check here]
   - Example: `curl -f https://staging-api.example.com/health`

5. Report:
   - Branch deployed
   - Commit hash
   - Migrations applied (if any)
   - Health check result
   - Any warnings or notes
