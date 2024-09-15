import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Register"
};

export default function Layout({ children }: Readonly<{children: React.ReactNode}>) {
  return (
    <div className="bg-slate-500">
      {children}
    </div>
  );
}