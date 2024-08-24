import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}


export function formatDate(date = new Date()) {
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Add leading zero for single-digit months
  const day = String(date.getDate()).padStart(2, '0');   

  const hour = String(date.getHours()).padStart(2, '0');
  const minute = String(date.getMinutes()).padStart(2, '0');
  const second = String(date.getSeconds()).padStart(2, '0');   


  return `${year}-${month}-${day} ${hour}:${minute}:${second}`;   

}


export const comparedTwoIsoDate = (date1: string, date2: string) => {
  
  const parsedDate1: Date = new Date(date1);
  const parsedDate2: Date = new Date(date2);
  
  // Get the difference in milliseconds
  const differenceInMilliseconds: number = parsedDate1.getTime() - parsedDate2.getTime();
  
  return differenceInMilliseconds;
}
