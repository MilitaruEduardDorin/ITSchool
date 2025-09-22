import psutil

psutil.cpu_count()
print(f"{psutil.cpu_count()}")

disk_usage=psutil.disk_usage("/")
disk_usage_total=disk_usage.total
disk_usage_free=disk_usage.free
print(f"{disk_usage_total/(1024**3): .2f} GB" )
print(f"{disk_usage_free/(1024**3): .2f} GB")

for proc in psutil.process_iter(["username","pid","name","status"]):
    print (proc.info)