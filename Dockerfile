FROM public.ecr.aws/lambda/python:3.8

WORKDIR /app
# Copy function code
COPY *.py requirements.txt /app/

# Install the function's dependencies using file requirements.txt
# from your project folder.
RUN pip install --no-cache-dir -r requirements.txt

RUN ["pytest", "-v", "--junitxml=reports/result.xml"]

CMD tail -f /dev/null