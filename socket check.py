# Google Cloud Function to check a socket prior to running a task
# Change "80" below to change the port 

def ping_ip_address(event, context):
  """
  This function pings an IP address.

  Args:
    event: The event object.
    context: The context object.

  Returns:
    A dictionary containing the status of the ping.
  """

  # Get the IP address from the event object.
  ip_address = event['ip_address']

  # Create a socket.
  socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

  # Try to connect to the IP address.
  try:
    socket.connect((ip_address, 80))
    socket.close()
    return {'status': 'success'}
  except socket.error:
    return {'status': 'failed'}
