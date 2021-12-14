FROM public.ecr.aws/lambda/python:3.8

WORKDIR /app
# Copy function code
COPY *.py requirements.txt /app/

# Install the function's dependencies using file requirements.txt
# from your project folder.
RUN  pip3 install -r requirements.txt --target "/app/"
RUN pytest -v .

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "python3","calculator.py" ]
