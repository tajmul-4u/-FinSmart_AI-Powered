# FinSmart++ Sample Data README

This directory contains sample configuration files and test data for the FinSmart++ application.

## Files Description

### Configuration Files

- **config.ini**: Main application configuration with settings for database, security, investment simulation, UI, and logging
- **investment_types.json**: Predefined investment options with risk levels and expected returns

### Sample Data Files

- **sample_users.csv**: Test user data for development and testing
- **sample_accounts.csv**: Test account data linked to sample users

## Usage

### For Development

These files are used during development to:

1. Test application functionality without creating real data
2. Demonstrate the application's data handling capabilities
3. Provide default configurations for new installations

### For Production

- Copy `config.ini` to your preferred location and modify settings
- Remove or replace sample data files with real data structures
- Ensure proper file permissions and security measures

## File Formats

### CSV Files

- Use comma-separated values
- First line can be a comment (starting with #)
- Follow the format specified in each file's header comment

### JSON Files

- Standard JSON format for structured data
- Used for complex data structures like investment types

### INI Files

- Configuration files using standard INI format
- Sections defined with [SectionName]
- Key=Value pairs for settings

## Security Notes

⚠️ **Important**: Sample data contains placeholder passwords and should never be used in production!

- All passwords in sample files are placeholders
- Implement proper password hashing in production
- Secure file permissions for configuration files
- Consider encrypting sensitive data files

## Customization

You can modify these files to:

- Add new investment types
- Change default application settings
- Create different test scenarios
- Adjust risk calculations and parameters
