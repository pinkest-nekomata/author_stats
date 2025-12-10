
## Tips and troubleshooting

# File issues

If you're getting errors that report files can't be found, you can add the following to a code cell anywhere to fetch and print the current working directory:

```
dir = os.getcwd()
print(dir)
```