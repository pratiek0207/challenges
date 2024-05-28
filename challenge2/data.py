import requests
import json

def get_azure_instance_metadata(key=None):
    try:
        # Azure instance metadata endpoint
        metadata_url = "http://169.254.169.254/metadata/instance?api-version=2021-02-01"

        # Headers to specify the metadata API version and format JSON
        headers = {'Metadata': 'true'}

        # Making GET request to Azure instance metadata endpoint
        response = requests.get(metadata_url, headers=headers)

        # Check if request was successful
        if response.status_code == 200:
            # Parsing JSON response
            metadata = response.json()
            if key:
                return metadata.get(key, f"Key '{key}' not found in metadata.")
            else:
                return metadata
        else:
            return {"error": "Failed to fetch Azure instance metadata"}

    except Exception as e:
        return {"error": str(e)}

def main():
    # Fetch all metadata
    azure_metadata = get_azure_instance_metadata()
    print("All metadata:")
    print(json.dumps(azure_metadata, indent=4))
    print()

    # Fetch a particular key from metadata
    key_to_fetch = "compute"
    print(f"Metadata for key '{key_to_fetch}':")
    specific_metadata = get_azure_instance_metadata(key_to_fetch)
    print(json.dumps(specific_metadata, indent=4))

if __name__ == "__main__":
    main()

