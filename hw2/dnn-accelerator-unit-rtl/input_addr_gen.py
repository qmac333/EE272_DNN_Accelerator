config_FY = 3  # Example configuration values
config_FX = 3
config_IC1 = 2
config_OY0 = 2
config_OX0 = 2
config_IY0 = 5
config_IX0 = 5
STRIDE = 2

print("Hello")
for fy in range(config_FY):
    for fx in range(config_FX):
        for oy in range(config_OY0):
            for ox in range(config_OX0):
                adr = (oy * STRIDE + fy) * (oy * config_IY0) + (ox * STRIDE + fx)
                print(f"fy: {fy}, fx: {fx}, oy: {oy}, ox: {ox}, adr: {adr}")

# print("Hello")
# for fy in range(config_FY):
#     for fx in range(config_FX):
#         for ic in range(config_IC1):
#             for oy in range(config_OY0):
#                 for ox in range(config_OX0):
#                     adr = (oy * STRIDE + fy) *(ox * STRIDE + fx)*(ic) + 
#                     print(f"fy: {fy}, fx: {fx}, ic: {ic}, oy: {oy}, ox: {ox}, adr: {adr}")